document.addEventListener('turbo:load', () => {
    const accordionHeaders = document.querySelectorAll('.accordion-header');
  
    accordionHeaders.forEach(header => {
      header.addEventListener('click', () => {
        // Toggle active class on header
        header.classList.toggle('active');
  
        // Toggle the accordion content visibility
        const content = header.nextElementSibling;
        if (content.style.display === 'block') {
          content.style.display = 'none';
          header.querySelector('.accordion-toggle-icon').textContent = '+';
        } else {
          content.style.display = 'block';
          header.querySelector('.accordion-toggle-icon').textContent = '−';
        }
      });
    });
  });
  