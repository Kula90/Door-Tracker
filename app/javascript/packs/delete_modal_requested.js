document.addEventListener('turbo:load', function() {
    const modal = document.getElementById('deleteModalRequested');
    if (!modal) return; // Exit if modal is not found

    attachDeleteModalListenersRequested();

    const noDataRow = document.querySelector('tr.fade-in');
    if (noDataRow && !noDataRow.classList.contains('show')) {
        void noDataRow.offsetWidth;
        noDataRow.classList.add('show');
    }
});

function attachDeleteModalListenersRequested() {
    const modal = document.getElementById('deleteModalRequested');
    const closeModal = modal.querySelector('.close-button');
    const cancelModal = modal.querySelector('.cancel-button');
    const deleteLinks = document.querySelectorAll('.delete-link-requested');
    const confirmDeleteButton = modal.querySelector('#confirmDeleteButtonRequested');

    if (!closeModal || !cancelModal || !confirmDeleteButton) {
        console.error("Some modal elements are missing or incorrect.");
        return;
    }

    let deleteUrl = '';
    let targetRow = null;

    deleteLinks.forEach(link => {
        link.addEventListener('click', function (event) {
            event.preventDefault();
            deleteUrl = this.getAttribute('data-url');
            targetRow = this.closest('tr');

            if (deleteUrl) {
                confirmDeleteButton.setAttribute('data-url', deleteUrl);
                modal.style.display = 'flex';
            } else {
                console.error("Delete URL is missing.");
            }
        });
    });

    [closeModal, cancelModal].forEach(element => {
        element.addEventListener('click', function () {
            modal.style.display = 'none';
        });
    });

    window.addEventListener('click', function (event) {
        if (event.target === modal) {
            modal.style.display = 'none';
        }
    });

    confirmDeleteButton.addEventListener('click', function (event) {
        event.preventDefault();
        const url = this.getAttribute('data-url');

        if (url) {
            fetch(url, {
                method: 'DELETE',
                headers: {
                    'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content,
                    'Content-Type': 'application/json',
                    'Accept': 'application/json'
                },
                credentials: 'same-origin'
            })
            .then(response => {
                if (response.ok) {
                    if (targetRow) {
                        targetRow.remove();
                    }
                    modal.style.display = 'none';

                    const tableBody = document.querySelector('.table-container tbody');
                    if (tableBody && tableBody.children.length === 0) {
                        const noDataRow = document.createElement('tr');
                        const noDataCell = document.createElement('td');
                        noDataCell.colSpan = 4;
                        noDataCell.textContent = 'No requested deliveries found';
                        noDataRow.appendChild(noDataCell);
                        noDataRow.classList.add('fade-in');
                        tableBody.appendChild(noDataRow);
                        void noDataRow.offsetWidth;
                        noDataRow.classList.add('show');
                    }
                } else {
                    console.error('Delete request failed:', response.statusText);
                }
            })
            .catch(error => console.error('Delete request failed:', error));
        }
    });
}
