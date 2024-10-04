// app/javascript/packs/delete_modal.js

document.addEventListener('turbo:load', attachDeleteModalListeners);
document.addEventListener('DOMContentLoaded', attachDeleteModalListeners);

function attachDeleteModalListeners() {
    const modal = document.getElementById('deleteModal');
    if (!modal) return; // Exit if no modal is found

    const closeModal = modal.querySelector('.close-button');
    const cancelModal = modal.querySelector('.cancel-button');
    const confirmDeleteButton = modal.querySelector('#confirmDeleteButton');

    const deleteLinks = document.querySelectorAll('.delete-link');

    let deleteUrl = '';

    // Ensure all necessary elements exist before adding event listeners
    if (!closeModal || !cancelModal || !confirmDeleteButton || deleteLinks.length === 0) {
        console.error("Some modal elements are missing or incorrect.");
        return;
    }

    // Open modal when delete link is clicked
    deleteLinks.forEach(link => {
        link.addEventListener('click', function (event) {
            event.preventDefault();
            deleteUrl = this.getAttribute('href');
            if (deleteUrl) {
                confirmDeleteButton.setAttribute('formaction', deleteUrl);
                modal.style.display = 'flex';
            } else {
                console.error("Delete URL is missing.");
            }
        });
    });

    // Close modal on click of 'X' or 'Cancel' button
    [closeModal, cancelModal].forEach(element => {
        element.addEventListener('click', function () {
            modal.style.display = 'none';
        });
    });

    // Close modal when clicking outside of modal content
    window.addEventListener('click', function (event) {
        if (event.target === modal) {
            modal.style.display = 'none';
        }
    });
}
