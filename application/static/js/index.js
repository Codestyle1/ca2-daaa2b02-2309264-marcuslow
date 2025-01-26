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

// // Generate Random Alphabets Button
// // Function to generate a random alphabet (A-Z)
// document.addEventListener('DOMContentLoaded', function () {
//     // Function to generate a random alphabet (A-Z)
//     function generateRandomAlphabet() {
//         const randomChar = String.fromCharCode(65 + Math.floor(Math.random() * 26)); // A-Z

//         // Send the random letter to the server using AJAX
//         fetch('/predict_random', {
//             method: 'POST',
//             headers: {
//                 'Content-Type': 'application/json',
//             },
//             body: JSON.stringify({ class_label: randomChar.toLowerCase() }),
//         })
//         .then(response => response.json())
//         .then(data => {
//             if (data.success) {
//                 // Update the input message
//                 const inputMessage = document.getElementById('input-message');
//                 if (inputMessage) {
//                     inputMessage.textContent = `Randomly Generated Input: '${randomChar.toLowerCase()}'`;
//                 }

//                 // Update the image
//                 const generatedImage = document.querySelector('.img-fluid');
//                 if (generatedImage) {
//                     generatedImage.src = data.image_url;
//                 }
//             } else {
//                 alert('Error generating image.');
//             }
//         })
//         .catch(error => {
//             console.error('Error:', error);
//             alert('An error occurred while generating the image.');
//         });
//     }

//     // Add event listener to the Random button
//     document.getElementById('random-alphabet-btn').addEventListener('click', generateRandomAlphabet);
// });