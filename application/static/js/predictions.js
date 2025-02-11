// Predict page javascript
document.getElementById('random-alphabet-btn').addEventListener('click', function () {
    // Make an AJAX request to the server
    fetch(predictRandomUrl, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({}) // No data needed, just trigger the random generation
    })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                // Update the input message
                document.getElementById('input-message').textContent = `Randomly Generated Input: '${data.class_label}'`;
                // Update the image source
                document.getElementById('generated-image').src = data.image_url;
                // Store the temporary filename and class label
                tempFilename = data.temp_filename;
                classLabel = data.class_label;
                // Show the "Save Image" button
                document.querySelector('.btn_predict.me-2').classList.remove('hidden'); // Show Save Image
            } else {
                console.error('Failed to generate image.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
});

document.getElementById('generateForm').addEventListener('submit', function (event) {
    event.preventDefault(); // Prevent default form submission
    const classLabel = document.getElementById('class_label').value.trim().toLowerCase();
    if (!classLabel || !classLabel.match(/^[a-z]$/)) {
        console.error('Please enter a valid single letter (A-Z).');
        return;
    }
    // Make an AJAX request to the server
    fetch(predictUrl, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: `class_label=${classLabel}`
    })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                // Update the image source
                document.getElementById('generated-image').src = data.image_url;
                // Update the input message
                document.getElementById('input-message').textContent = `Your Input: '${data.class_label}'`;
                // Show the "Save Image" button
                document.querySelector('.btn_predict.me-2').classList.remove('hidden'); // Show Save Image
            } else {
                console.error('Failed to generate image.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
});

document.getElementById('confirm-save-btn').addEventListener('click', function () {
    const saveButton = this;
    const loadingOverlay = document.getElementById('loading-overlay'); // Loading animation container

    // Disable the "Save" button and show the loading state
    saveButton.disabled = true;
    saveButton.textContent = "Saving...";

    // Disable all user interactions by setting pointer events to none on the entire body
    document.body.style.pointerEvents = "none";

    // Show the loading overlay (make sure it's visible)
    loadingOverlay.classList.remove('hidden');

    // Make sure there's an image to save
    if (!tempFilename || !classLabel) {
        console.error("No image to save. Please generate an image first.");
        return;
    }

    // Start saving the image (fetch request)
    fetch("/save_image", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
            temp_filename: tempFilename,
            class_label: classLabel,
        }),
    })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                // Delay the redirect to allow the loading animation to stay visible
                setTimeout(function() {
                    window.location.href = data.redirect_url; // Redirect after saving
                }, 3000);  // Adjust this delay if needed to match the animation duration
            } else {
                console.error("Failed to save image.");
                alert(data.error || 'An error occurred while saving the image.');
            }
        })
        .catch(error => {
            console.error("Error:", error);
            alert('An unexpected error occurred.');
        })
        .finally(() => {
            // Re-enable all interactions after the process is complete
            document.body.style.pointerEvents = "auto";  // Re-enable clicks
            // Loading overlay will remain visible until the redirect happens, no need to hide it here.
        });
});
