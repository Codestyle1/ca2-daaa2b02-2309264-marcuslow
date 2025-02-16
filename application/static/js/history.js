function updatePredictionsTable(predictions) {
    const tableBody = document.getElementById('predictions-table-body');
    tableBody.innerHTML = ''; // Clear existing rows

    if (predictions.length === 0) {
        tableBody.innerHTML = '<tr><td colspan="6">No predictions found.</td></tr>';
        return;
    }

    predictions.forEach((prediction, index) => {
        const row = document.createElement('tr');
        row.id = `prediction-${prediction.id}`;  // Keep same ID structure

        row.innerHTML = `
            <td>${index + 1}</td>
            <td>
                <img src="${prediction.image_url}" alt="Generated Image" style="max-width: 100px;" loading="lazy">
            </td>
            <td>${prediction.class_label}</td>
            <td>${prediction.model_name}</td>
            <td>${prediction.predicted_on}</td>
            <td>
                <button class="btn-sm btn-danger" onclick="deletePrediction('${prediction.id}')">Delete</button>
            </td>
        `;

        tableBody.appendChild(row); // Append row to existing table
    });
}


document.addEventListener("DOMContentLoaded", function () {
    // Retrieve pagination data from the hidden element
    const paginationDataElem = document.getElementById('pagination-data');
    const currentPage = parseInt(paginationDataElem.getAttribute('data-current-page'));
    const totalPages = parseInt(paginationDataElem.getAttribute('data-total-pages'));
    const filterButton = document.getElementById('show-filter-btn');
    const filterContainer = document.getElementById('filter-container');
    const classSlider = document.getElementById("class-slider");
    const filterForm = document.getElementById('filter-form');
    const sliderValue = document.getElementById("slider-value");
    const tableBody = document.getElementById('predictions-table-body');
    const resetButton = document.getElementById('reset-filter-btn');
    document.getElementById("reset-filter-btn").addEventListener("click", resetFilters);


    // Define modelSelect here inside the DOMContentLoaded function
    const modelSelect = document.getElementById("model");
    const classLengthInput = document.getElementById("class-length");

    // Open stats modal when clicking the stats button
    const statsModal = document.getElementById("stats-modal");
    document.getElementById("show-stats-btn").addEventListener("click", function() {
        statsModal.style.display = "flex";
    });

    // Close modal when clicking anywhere outside the modal content
    statsModal.addEventListener("click", function (event) {
        if (event.target === statsModal) {
            statsModal.style.display = "none";
        }
    });

    // Real-time update: Calculate time since first prediction
    function updateTimeSinceFirst() {
        const firstPredictionElem = document.getElementById("first-prediction-time");
        if (!firstPredictionElem) return;
        const firstPredictionTime = new Date(firstPredictionElem.getAttribute("data-first-prediction"));
        const now = new Date();
        const diff = now - firstPredictionTime;
        const seconds = Math.floor((diff / 1000) % 60);
        const minutes = Math.floor((diff / (1000 * 60)) % 60);
        const hours = Math.floor((diff / (1000 * 60 * 60)) % 24);
        const days = Math.floor(diff / (1000 * 60 * 60 * 24));
        const timeString = `${days}d ${hours}h ${minutes}m ${seconds}s`;
        document.getElementById("time-since-first").textContent = timeString;
    }
    setInterval(updateTimeSinceFirst, 1000);
    updateTimeSinceFirst();

    // Function to update row numbers dynamically after deletion
    function updateRowNumbers() {
        const rows = document.querySelectorAll('.table tbody tr');
        rows.forEach((row, index) => {
            const rowNumberCell = row.querySelector('td:first-child');
            rowNumberCell.textContent = index + 1;
        });
    }

    // Delete prediction function with AJAX and dynamic update
    window.deletePrediction = function (predictionId) {
        if (!confirm("Are you sure you want to delete this prediction?")) {
            return;
        }

        fetch(`/delete_prediction/${predictionId}`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                const row = document.getElementById(`prediction-${predictionId}`);
                // Fade out the row
                row.style.transition = "opacity 1s ease-out";
                row.style.opacity = 0;
                setTimeout(() => {
                    row.remove();
                    updateRowNumbers();

                    // Check if no rows remain and handle pagination
                    const remainingRows = document.querySelectorAll('.table tbody tr');
                    const pageSize = 10;
                    if (remainingRows.length === 0) {
                        document.querySelector('.no-history-container').style.display = 'block';
                        document.querySelector('.table').style.display = 'none';
                    } else if (remainingRows.length < pageSize && currentPage < totalPages) {
                        // If fewer rows than pageSize remain and not on the last page,
                        // reload the current page to shift rows from the next page.
                        window.location.href = `/history?page=${currentPage}`;
                    }
                }, 1000);
            } else {
                alert('Error deleting the prediction: ' + data.error);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('An error occurred while deleting the prediction.');
        });
    };

    // Update the displayed letter when the slider is moved
    if (classSlider) {
        classSlider.addEventListener("input", function () {
            const letter = String.fromCharCode(65 + parseInt(classSlider.value)); // 65 = ASCII value for 'A'
            sliderValue.textContent = letter;  // Update the displayed letter
            console.log("Selected Letter:", letter);
        });
    }
    // Handle form submission
    filterForm.addEventListener('submit', function (event) {
        event.preventDefault(); // Prevent default form submission

        // Get elements safely
        const classSlider = document.getElementById("class-slider");
        const modelSelect = document.getElementById("model");
        const classLengthInput = document.getElementById("class-length");

        // Get values
        const classLabel = classSlider ? parseInt(classSlider.value) : null; // Convert range input to a number
        const model = modelSelect ? modelSelect.value : null;
        const classLabelLength = classLengthInput ? classLengthInput.value.trim() : null;

        console.log("classLabel:", classLabel);  // Debugging log

        // Create an object with only non-null values
        const filterData = {};

        if (classLabel !== null) {
            filterData.class_label = String.fromCharCode(65 + classLabel); // Convert number to A-Z
        }
        if (model) {
            filterData.model = model;
        }
        if (classLabelLength) {
            filterData.class_label_length = classLabelLength;
        }

        // If no filters are applied, return without sending request
        if (Object.keys(filterData).length === 0) {
            console.log("No filters applied. Displaying all predictions.");
            return;
        }

        // Send filter data to the server
        fetch('/filter_predictions', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(filterData) // Send only valid filters
        })
        .then(response => response.json())
        .then(data => {
            console.log("Filtered predictions:", data.filtered_predictions);
            tableBody.innerHTML = '';

            if (data.filtered_predictions.length === 0) {
                tableBody.innerHTML = '<tr><td colspan="6">No predictions found.</td></tr>';
                return;
            }

            data.filtered_predictions.forEach((prediction, index) => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${index + 1}</td>
                    <td><img src="${prediction.image_url}" style="max-width: 100px;"></td>
                    <td>${prediction.class_label}</td>
                    <td>${prediction.model_name}</td>
                    <td>${prediction.predicted_on}</td>
                    <td>
                        <button class="btn-sm btn-danger" onclick="deletePrediction('${prediction.id}')">Delete</button>
                    </td>
                `;
                tableBody.appendChild(row);
            });
        })
        .catch(error => {
            console.error('Error:', error);
            alert('An error occurred while applying the filter.');
        });
    });

    // Toggle filter container visibility on button click
    filterButton.addEventListener('click', function () {
        if (filterContainer.style.display === 'none' || filterContainer.style.display === '') {
            filterContainer.style.display = 'block'; // Show the filter container
        } else {
            filterContainer.style.display = 'none'; // Hide the filter container
        }
    });

    // Function to update the displayed letter as the slider value changes
    classSlider.addEventListener("input", function () {
        const letter = String.fromCharCode(65 + parseInt(classSlider.value)); // 65 is the ASCII value of 'A'
        sliderValue.textContent = letter; // Display the corresponding letter
    });

    // Function to reset filters
    function resetFilters() {
        // Reset all input values to default
        document.getElementById("class-slider").value = 1;
        document.getElementById("slider-value").textContent = 'A'; // Reset letter display
        document.getElementById("model").value = "";
        document.getElementById("class-length").value = "";
    
        // Fetch and reload all predictions
        fetch('/filter_predictions', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({}) // Send empty filter to fetch all data
        })
        .then(response => response.json())
        .then(data => updatePredictionsTable(data.filtered_predictions)) // FIXED: Now defined
        .catch(error => {
            console.error('Error:', error);
            alert('An error occurred while resetting the filters.');
        });
    }    

    // Event listener for reset button
    resetButton.addEventListener("click", resetFilters);

});
