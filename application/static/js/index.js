// Generate Alphabets button
document.getElementById('generateButton').addEventListener('click', function() {
    const classInput = document.getElementById('classInput').value.trim().toUpperCase();  // Get user input (class label)

    if (classInput && classInput.length === 1 && /^[A-Z]$/.test(classInput)) {
        // Use jQuery's AJAX method to send the request
        $.ajax({
            url: '/predict',  // The route for generating the image
            type: 'POST',  // POST method
            contentType: 'application/json',  // Send as JSON
            data: JSON.stringify({ class_label: classInput }),  // Send the class label
            success: function(data) {
                if (data.image_base64) {
                    // Display the generated image on the page
                    const generatedImage = document.getElementById('generatedImage');
                    generatedImage.src = 'data:image/png;base64,' + data.image_base64;
                    generatedImage.style.display = 'block';  // Show the image
                } else {
                    alert("Error generating image.");
                }
            },
            error: function(xhr, status, error) {
                console.error("Error:", error);  // Log the error in the console
                alert("An error occurred while generating the image.");
            }
        });
    } else {
        alert('Please enter a valid class label (A-Z).');
    }
});