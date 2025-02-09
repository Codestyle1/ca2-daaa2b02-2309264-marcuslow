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
    if (!tempFilename || !classLabel) {
        console.error("No image to save. Please generate an image first.");
        return;
    }

    // Disable the button to prevent multiple clicks
    saveButton.disabled = true;
    saveButton.textContent = "Saving...";

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
                // Redirect to history page
                window.location.href = data.redirect_url;
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
            saveButton.disabled = false;
            saveButton.textContent = "Save";
        });
});
