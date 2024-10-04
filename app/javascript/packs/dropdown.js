import { createPopper } from '@popperjs/core';

function initializeDropdowns() {
    document.querySelectorAll('.dropbtn').forEach(button => {
        // Remove any existing event listeners to prevent duplication
        button.removeEventListener('click', handleDropdownClick);
        button.addEventListener('click', handleDropdownClick);
    });
}

function handleDropdownClick(event) {
    event.stopPropagation(); // Prevents the click event from bubbling up to the document

    const dropdown = this.closest('.dropdown'); // Get the closest dropdown parent
    const dropdownContent = dropdown.querySelector('.dropdown-content');

    // Check if this dropdown is already open
    const isCurrentlyOpen = dropdown.classList.contains('show');

    // Close all dropdowns
    closeAllDropdowns();

    // If the dropdown was not already open, open it
    if (!isCurrentlyOpen) {
        dropdown.classList.add('show');  // Show this dropdown

        // Create a Popper instance and set it to 'fixed' to allow escaping the table
        createPopper(this, dropdownContent, {
            placement: 'bottom-end', // Adjusts to the right side (so it doesn't shift)
            strategy: 'fixed', // Ensures it breaks out of table boundaries
            modifiers: [
                {
                    name: 'preventOverflow',
                    options: {
                        boundary: 'viewport', // Keeps the dropdown within the viewport
                    },
                },
                {
                    name: 'offset',
                    options: {
                        offset: [0, 8], // Small offset to position below the button
                    },
                },
            ],
        });
    }
}

function closeAllDropdowns() {
    document.querySelectorAll('.dropdown').forEach(dropdown => {
        dropdown.classList.remove('show'); // Remove the show class from all dropdowns
    });
}

// Initialize dropdowns when the DOM is fully loaded
document.addEventListener('DOMContentLoaded', function () {
    initializeDropdowns();

    // Close the dropdown when clicking outside of it
    window.addEventListener('click', function () {
        closeAllDropdowns(); // Close all dropdowns if clicking outside
    });
});

// Ensure dropdowns are reinitialized after every Turbo page load
document.addEventListener('turbo:load', function () {
    initializeDropdowns();
});

// Reinitialize dropdowns after any AJAX request completes
document.addEventListener('ajax:complete', function () {
    initializeDropdowns();
});
