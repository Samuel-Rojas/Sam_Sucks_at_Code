const habitCheckboxes = document.querySelectorAll('input[type="checkbox"]');


habitCheckboxes.forEach(checkbox => {
    checkbox.addEventListener('click', handleHabitClick);
  });
  
  function handleHabitClick(event) {
    // This function will be executed when a checkbox is clicked
    const clickedCheckbox = event.target;
    // Implement logic to track completion based on checkbox state (checked/unchecked)
  }
  