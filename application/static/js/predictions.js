document.addEventListener("DOMContentLoaded", function () {
    const randomAlphabetBtn = document.getElementById('random-alphabet-btn');
    const generateForm = document.getElementById('generateForm');
    const generateCombinedForm = document.getElementById('generateCombinedForm');
    const confirmSaveBtn = document.getElementById('confirm-save-btn');
    const saveImageBtn = document.getElementById('save-image-btn');
    const loadingOverlay = document.getElementById('loading-overlay'); // Loading animation container
    const card = document.querySelector(".thecard");
    const wrappers = document.querySelectorAll('[id="wrapper_predict"]'); // Select both wrappers
    const allSingleButtons = document.querySelectorAll('.clickable-box-single');
    const allMultipleButtons = document.querySelectorAll('.clickable-box-multiple');
    const generateCombinedBtn = document.querySelector('.btn-generate-multiple'); // Button for combined generation
    const imgElement = document.getElementById('combined-generated-image');
    const saveCombinedImageBtn = document.getElementById('save-combined-image-btn');
    let tempFilename, classLabel; // To hold the filename and class label
    let selectedModel = 'cgan';  // Default model set to 'cgan'

    // Function to handle the button click (mark as active)
    function handleButtonClick(buttons, button) {
        buttons.forEach(b => {
            b.classList.remove('active'); // Remove 'active' class from all buttons
        });
        button.classList.add('active'); // Add 'active' class to the clicked button
    }

    // Add click event listeners for '.clickable-box-single' buttons (CGAN and DCGAN)
    allSingleButtons.forEach(button => {
        button.addEventListener('click', function() {
            handleButtonClick(allSingleButtons, button);  // Apply to '.clickable-box-single'
            handleButtonClick(allMultipleButtons, button); // Apply to '.clickable-box-multiple'
            selectedModel = button.textContent.trim().toLowerCase(); // Update selected model
        });
    });

    // Add click event listeners for '.clickable-box-multiple' buttons
    allMultipleButtons.forEach(button => {
        button.addEventListener('click', function() {
            handleButtonClick(allMultipleButtons, button);  // Apply to '.clickable-box-multiple'
            handleButtonClick(allSingleButtons, button);  // Apply to '.clickable-box-single'
            selectedModel = button.textContent.trim().toLowerCase(); // Update selected model
        });
    });

    // Set the first buttons as active on both front and back cards when the page loads
    const firstSingleButton = document.querySelector('.clickable-box-single');
    const firstMultipleButton = document.querySelector('.clickable-box-multiple');
    
    if (firstSingleButton) {
        firstSingleButton.classList.add('active');
    }
    if (firstMultipleButton) {
        firstMultipleButton.classList.add('active');
    }

    // Handle Card Flip
    wrappers.forEach(wrapper => {
        wrapper.addEventListener("click", function (event) {
            if (event.target.tagName === "BUTTON" || event.target.tagName === "INPUT" || event.target.tagName === "TEXTAREA"
                || event.target.classList.contains('clickable-box-single') || event.target.classList.contains('clickable-box-multiple')
            ) {
                return;
            }
            card.classList.toggle("flipped");
            // Sync active states after flip
            syncActiveState();
        });
    });

    // Function to sync active states across both front and back cards
    function syncActiveState() {
        const activeFrontButton = document.querySelector('.clickable-box-single.active');
        if (activeFrontButton) {
            const activeText = activeFrontButton.textContent.trim(); 
            const correspondingBackButton = Array.from(allMultipleButtons).find(button => button.textContent.trim() === activeText);
            if (correspondingBackButton) {
                handleButtonClick(allMultipleButtons, correspondingBackButton);
            }
        }
        
        const activeBackButton = document.querySelector('.clickable-box-multiple.active');
        if (activeBackButton) {
            const activeText = activeBackButton.textContent.trim();  
            const correspondingFrontButton = Array.from(allSingleButtons).find(button => button.textContent.trim() === activeText);
            if (correspondingFrontButton) {
                handleButtonClick(allSingleButtons, correspondingFrontButton);
            }
        }
    }

    // Handle random alphabet generation
    if (randomAlphabetBtn) {
        randomAlphabetBtn.addEventListener('click', function () {

            fetch(predictRandomUrl, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ model_name: selectedModel }) // Make sure selectedModel is defined
            })
            .then(response => {
                return response.json();
            })
            .then(data => {
                if (data.success) {
                    document.getElementById('input-message').textContent = `Randomly Generated Input: '${data.class_label}'`;
                    document.getElementById('generated-image').src = data.image_url;
                    tempFilename = data.temp_filename;
                    classLabel = data.class_label;
                    saveImageBtn.classList.remove('hidden'); // Show Save Image button
                } else {
                    console.error('Failed to generate image. Server response:', data);
                }
            })
            .catch(error => console.error('Fetch error:', error));
        });
    }

    // Handle single letter generation
    if (generateForm) {
        generateForm.addEventListener('submit', function (event) {
            event.preventDefault();
            const classLabelInput = document.getElementById('class_label').value.trim().toLowerCase();
            if (!classLabelInput || !classLabelInput.match(/^[a-z]$/)) {
                console.error('Please enter a valid single letter (A-Z).');
                return;
            }

            fetch(predictUrl, {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: `class_label=${classLabelInput}&model_name=${selectedModel}`
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    document.getElementById('generated-image').src = data.image_url;
                    document.getElementById('input-message').textContent = `Your Input: '${data.class_label}'`;
                    tempFilename = data.temp_filename;
                    classLabel = data.class_label;
                    saveImageBtn.classList.remove('hidden'); // Show Save Image button
                } else {
                    console.error('Failed to generate image.');
                }
            })
            .catch(error => console.error('Error:', error));
        });
    }

    // Handle combined image generation (Merged Logic)
    if (generateCombinedForm) {
        generateCombinedForm.addEventListener('submit', function (event) {
            event.preventDefault();
            
            let classLabels = document.getElementById('class_label_combined').value.trim();

            // Hide the save button and input message, and show loading state
            saveCombinedImageBtn.classList.add('hidden');
            document.getElementById('combined-input-message').style.display = 'none';
            card.style.pointerEvents = 'none';
            generateCombinedBtn.classList.add('btn-loading');
            generateCombinedBtn.textContent = 'Generating...';
            generateCombinedBtn.style.backgroundColor = '#ffcc00';

            setTimeout(() => {
                imgElement.src = '/static/images/loading_img.gif';  // Show loading GIF

                // Send a request to generate the combined image
                fetch('/predict_words', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                    body: `class_label_combined=${encodeURIComponent(classLabels)}&model_name=${encodeURIComponent(selectedModel)}`
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        // Display the combined input message
                        document.getElementById('combined-input-message').innerHTML = `Combined Input: ${data.class_label}`;
                        document.getElementById('combined-input-message').style.display = 'block';

                        // Create and load the new image
                        const newImage = new Image();
                        newImage.src = data.image_url;
                        newImage.onload = function() {
                            imgElement.src = newImage.src;  // Update the image element
                            saveCombinedImageBtn.classList.remove('hidden');  // Show the save button
                            tempFilename = data.combined_img_filename;  // Save the filename for later use
                            classLabel = data.class_label;  // Save the class label
                        };

                    } else {
                        console.error('Failed to generate combined image.');
                        alert(data.message || 'Failed to generate image.');
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('An error occurred while generating the combined image.');
                })
                .finally(() => {
                    card.style.pointerEvents = 'auto';  // Enable card interaction
                    generateCombinedBtn.classList.remove('btn-loading');  // Remove loading state
                    generateCombinedBtn.textContent = 'Generate Combined';  // Reset the button text
                    generateCombinedBtn.style.backgroundColor = '';  // Reset the background color
                });

            }, 100);  // Delay to avoid UI flicker
        });
    }

    // Handle Save Button Click
    if (confirmSaveBtn) {
        confirmSaveBtn.addEventListener('click', function () {
            const saveButton = this;
            saveButton.disabled = true;
            saveButton.textContent = "Saving...";
            document.body.style.pointerEvents = "none";
            loadingOverlay.style.display = 'flex';

            // Log both image sources for debugging
            const frontImageSrc = document.getElementById('generated-image').src;
            const combinedImageSrc = document.getElementById('combined-generated-image').src;

            // Check if both the front image and combined image are empty or placeholder
            if ((!frontImageSrc || frontImageSrc.includes('empty_img_placeholder')) &&
                (!combinedImageSrc || combinedImageSrc.includes('empty_img_placeholder'))) {
                alert("Please generate an image first.");
                saveButton.disabled = false;
                saveButton.textContent = "Save Image";
                document.body.style.pointerEvents = "auto";
                loadingOverlay.style.display = 'none';
                return;
            }

            // Check if the front image is valid
            if (frontImageSrc && !frontImageSrc.includes('empty_img_placeholder')) {
                // Handle saving front image
                if (!tempFilename || !classLabel) {
                    alert("Front image data is missing. Please generate a front image first.");
                    saveButton.disabled = false;
                    saveButton.textContent = "Save Image";
                    document.body.style.pointerEvents = "auto";
                    loadingOverlay.style.display = 'none';
                    return;
                }

                // Proceed with saving the front image
                fetch("/save_image", {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify({
                        temp_filename: tempFilename,
                        class_label: classLabel,
                        model_name: selectedModel
                    }),
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        setTimeout(() => {
                            window.location.href = data.redirect_url;
                        }, 2000);
                    } else {
                        alert(data.error || 'An error occurred while saving the image.');
                    }
                })
                .catch(error => alert('An unexpected error occurred.'))
                .finally(() => {
                    saveButton.disabled = false;
                });

            } else if (combinedImageSrc && !combinedImageSrc.includes('empty_img_placeholder')) {
                // Handle saving combined image
                if (!tempFilename || !classLabel) {
                    alert("Combined image data is missing. Please generate a combined image first.");
                    saveButton.disabled = false;
                    saveButton.textContent = "Save Image";
                    document.body.style.pointerEvents = "auto";
                    loadingOverlay.style.display = 'none';
                    return;
                }

                // Proceed with saving the combined image
                fetch("/save_image", {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify({
                        temp_filename: tempFilename,
                        class_label: classLabel,
                        model_name: selectedModel
                    }),
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        setTimeout(() => {
                            window.location.href = data.redirect_url;
                        }, 2000);
                    } else {
                        alert(data.error || 'An error occurred while saving the image.');
                    }
                })
                .catch(error => alert('An unexpected error occurred.'))
                .finally(() => {
                    saveButton.disabled = false;
                });

            }
        });
    }
});
