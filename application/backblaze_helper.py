from b2sdk.v2 import B2Api, InMemoryAccountInfo
from os import getenv
from PIL import Image
from io import BytesIO
import requests

# Load environment variables
B2_KEY_ID = getenv('B2_KEY_ID')
B2_APPLICATION_KEY = getenv('B2_APPLICATION_KEY')
B2_BUCKET_NAME = getenv('B2_BUCKET_NAME')

class BackblazeHelper:
    def __init__(self):
        # Initialize Backblaze API
        self.info = InMemoryAccountInfo()
        self.b2_api = B2Api(self.info)
        self.b2_api.authorize_account("production", B2_KEY_ID, B2_APPLICATION_KEY)
        self.bucket = self.b2_api.get_bucket_by_name(B2_BUCKET_NAME)

    def upload_file(self, file_buffer, file_name):
        """
        Uploads raw bytes to Backblaze B2.
        :param file_buffer: BytesIO object containing the file data.
        :param file_name: The name to assign to the file in Backblaze.
        :return: The uploaded file name.
        """
        # Upload the file using raw bytes
        uploaded_file = self.bucket.upload_bytes(
            file_buffer.getvalue(),  # Use .getvalue() to get the raw bytes from BytesIO
            file_name=file_name,
            content_type="image/png"
        )
        return uploaded_file.file_name

    def generate_signed_url(self, file_name, expiration_time=3600):
        """
        Generates a signed URL for a private file in Backblaze.
        :param file_name: The name of the file in Backblaze.
        :param expiration_time: Time in seconds until the signed URL expires (default: 1 hour).
        :return: A signed URL for downloading the file or None if the file does not exist.
        """
        try:
            # ✅ Check if the file exists before generating the URL
            self.bucket.get_file_info_by_name(file_name)  # Will raise an exception if the file is missing
            
            # Generate a download authorization token
            download_auth = self.bucket.get_download_authorization(
                file_name_prefix=file_name,  # Should be the exact file name or a prefix
                valid_duration_in_seconds=expiration_time
            )
            
            # Construct the base download URL
            base_url = self.b2_api.get_download_url_for_file_name(self.bucket.name, file_name)
            
            # Append the authorization token to the URL (no need to access via `authorization_token`)
            signed_url = f"{base_url}?Authorization={download_auth}"

            return signed_url
        except Exception as e:
            print(f"Error: {e} (File may not exist)")
            return None
