const inputField = document.getElementById("input-tab")
const addTaskBtn = document.getElementById("add-task")
const displayContainer = document.getElementById('display-container')
const taskTitle = document.getElementById('task-title')
// const taskCheckbox = document.getElementById('task-checkbox')
const taskTemplate = document.getElementById('task-template')


let isCompleted = false;

const addTask = () =>{

    
    //Get value from the user 
    const userInput = inputField.value

    //HTML Code that We want to display
    let displayContent = `
    <input type="checkbox" style="display: inline-block;">
    <h2 id="task-title" ${isCompleted ? 'style="text-decoration: line-through;"' : ''}>${userInput}</h2>
    <button>Delete</button>`
   

    //Creates and assigns new element to display code
    let newTaskElement = document.createElement('div')
    newTaskElement.innerHTML = displayContent

    //Display to DOM
    displayContainer.insertBefore(newTaskElement, displayContainer.firstChild)
    



    //Remove input from the textBox
    inputField.value = ""



}



addTaskBtn.addEventListener('click', addTask)

addTaskBtn.addEventListener('click', addTask);

// Event listener for deleting tasks (using event delegation)
displayContainer.addEventListener('click', handleDeleteTask);

function handleDeleteTask(event) {
  // Check if the clicked element is a delete button
  if (event.target.tagName.toLowerCase() === 'button') {
    // Access the parent element (the task to be deleted)
    const taskToDelete = event.target.parentElement;
    // Remove the task element from the DOM
    taskToDelete.remove();
  }
}































