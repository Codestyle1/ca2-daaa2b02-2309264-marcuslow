// var canvas = document.querySelector("#canvas");
// var context = canvas.getContext("2d");
// (function() {
//     canvas.width = 280;
//     canvas.height = 280;
//     var Mouse = {x:0, y:0};
//     var lastMouse = {x:0, y:0};
//     context.fillStyle = "white";
//     context.fillRect(0, 0, canvas.width, canvas.height);
//     context.color = "black";
//     context.lineWidth = 20;
//     context.lineJoin = context.lineCap = 'round';
//     canvas.addEventListener("mousemove", function(e) {
//     lastMouse.x = Mouse.x;
//     lastMouse.y = Mouse.y;
//     // Mouse.x = e.pageX - this.offsetLeft-120;
//     // Mouse.y = e.pageY - this.offsetTop-280;
//     var rect = canvas.getBoundingClientRect();
//     Mouse.x = e.clientX - rect.left;
//     Mouse.y = e.clientY - rect.top;
//     console.log(Mouse.x + "," + Mouse.y + "," + rect.left + "," + rect.top)
//     }, false);
//     canvas.addEventListener("mousedown", function(e) {
//     canvas.addEventListener("mousemove", onPaint, false);
//     }, false);
//     canvas.addEventListener("mouseup", function() {
//     canvas.removeEventListener("mousemove", onPaint, false);
//     }, false);
//     var onPaint = function() {
//     context.lineWidth = context.lineWidth;
//     context.lineJoin = "round";
//     context.lineCap = "round";
//     context.strokeStyle = context.color;
//     context.beginPath();
//     context.moveTo(lastMouse.x, lastMouse.y);
//     context.lineTo(Mouse.x,Mouse.y );
//     context.closePath();
//     context.stroke();
//     };
//     }());
//     $("#clearButton").on("click", function() {
//     context.clearRect( 0, 0, 280, 280 );
//     context.fillStyle="white";
//     context.fillRect(0,0,canvas.width,canvas.height);
//     });
//     $("#predictButton").click(function() {
//         $('#result').text(' Predicting...');
//         var img = canvas.toDataURL('image/png');
//         console.log("Image Data being sent:", img);  // Add this line to log the image data
    
//         $.ajax({
//             type: "POST",
//             url: "http://127.0.0.1:5000/predict",
//             data: img,
//             success: function(data) {
//                 console.log("Response from server:", data);  // Log the response from the server
//                 $('#result').text('Predicted Output: ' + data);
//             },
//             error: function(xhr, status, error) {
//                 console.error("AJAX error: ", status, error);  // Log AJAX errors
//             }
//         });     
// });

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
