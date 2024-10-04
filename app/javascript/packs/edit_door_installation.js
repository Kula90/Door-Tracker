// app/javascript/packs/edit_door_installation.js

document.addEventListener("DOMContentLoaded", function() {
    console.log("edit_door_installation.js is loaded");
  
    const daySelect = document.querySelector('#edit_door_installation_installation_date_3i');
    const monthSelect = document.querySelector('#edit_door_installation_installation_date_2i');
    const yearSelect = document.querySelector('#edit_door_installation_installation_date_1i');
    const formattedDateField = document.querySelector('#formatted_installation_date');
  
    console.log("Day select element:", daySelect);
    console.log("Month select element:", monthSelect);
    console.log("Year select element:", yearSelect);
  
    if (daySelect && monthSelect && yearSelect) {
      const updateFormattedDate = () => {
        const day = ("0" + daySelect.value).slice(-2);
        const month = ("0" + monthSelect.value).slice(-2);
        const year = yearSelect.value;
        const formattedDate = `${day}-${month}-${year}`;
        formattedDateField.value = formattedDate;
        console.log("Formatted date:", formattedDate);
      };
  
      // Initial update
      updateFormattedDate();
  
      // Add event listeners
      daySelect.addEventListener('change', updateFormattedDate);
      monthSelect.addEventListener('change', updateFormattedDate);
      yearSelect.addEventListener('change', updateFormattedDate);
    }
  });
