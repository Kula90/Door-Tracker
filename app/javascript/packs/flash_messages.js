document.addEventListener('turbo:load', () => {
    // Check if we're on the construction_sites page
    const body = document.body;
    if (!body.classList.contains('construction_sites')) return;

    // Automatically hide flash messages after 5 seconds (5000ms)
    const flashMessage = document.querySelector('.alert');
    if (flashMessage) {
        setTimeout(() => {
            flashMessage.style.transition = 'opacity 0.5s ease';
            flashMessage.style.opacity = '0';
            setTimeout(() => flashMessage.remove(), 500); // Remove from DOM after fade-out
        }, 10000);

        // Handle close button click
        const closeButton = flashMessage.querySelector('.close-btn');
        if (closeButton) {
            closeButton.addEventListener('click', () => {
                flashMessage.style.transition = 'opacity 0.5s ease';
                flashMessage.style.opacity = '0';
                setTimeout(() => flashMessage.remove(), 500); // Remove from DOM
            });
        }
    }
});
