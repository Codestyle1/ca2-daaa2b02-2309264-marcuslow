document.addEventListener("DOMContentLoaded", function () {
    let sidebar = document.getElementById("stats-sidebar");
    let toggleButton = document.createElement("div"); // Create toggle button
    let isSidebarOpen = false; // Track sidebar state

    // Create and style the toggle button
    toggleButton.classList.add("sidebar-toggle");
    toggleButton.innerHTML = "▶";
    document.body.appendChild(toggleButton);

    // Function to update button position
    function updateButtonPosition() {
        toggleButton.style.left = isSidebarOpen ? "440px" : "10px";
        toggleButton.style.transform = isSidebarOpen ? "rotate(180deg)" : "rotate(0deg)";
    }

    // Toggle sidebar when clicking on it
    sidebar.addEventListener("click", function () {
        isSidebarOpen = !isSidebarOpen;
        sidebar.style.left = isSidebarOpen ? "0" : "-400px";
        updateButtonPosition();
    });

    // Toggle sidebar when clicking the button
    toggleButton.addEventListener("click", function (event) {
        event.stopPropagation(); // Prevent sidebar click from interfering
        isSidebarOpen = !isSidebarOpen;
        sidebar.style.left = isSidebarOpen ? "0" : "-400px";
        updateButtonPosition();
    });

    // Set initial button position
    updateButtonPosition();
});
