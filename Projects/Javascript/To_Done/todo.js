const inputField = document.getElementById("input-tab")
const addTaskBtn = document.getElementById("add-task")
const displayContainer = document.getElementById('display-container')
const taskTitle = document.getElementById('task-title')
const taskCheckbox = document.getElementById('task-checkbox')
const taskTemplate = document.getElementById('task-template')


const addTask = () =>{

    // //Gets the User Input
    // const userInput = inputField.value

    // //Get the innerHTML of the empty template
    // const taskTemplateHTML = document.getElementById('task-template').innerHTML

    // //Create a new div 
    // const newTaskElement = document.createElement("div")

    // //Accessing the checkbox element and attaching a event listener to it 
    // const taskCheckbox = document.getElementById("task-checkbox")
    // //taskCheckbox.addEventListener('change', handleCheckbox)

    // //Set the Inner HTML of the new element and un-hide the element
    // newTaskElement.innerHTML = taskTemplateHTML
    // newTaskElement.style.display = "block"

    // //Get the h2 and p elements and set them to the user input 
    // const taskTitle = newTaskElement.querySelector(".task-title")

    // //Add the input to the title 
    // taskTitle.textContent = userInput

    // displayContainer.appendChild(newTaskElement);

    // // Reset the input field (optional)
    // inputField.value = '';

    //This function gets the user input and pushes that value into a div that is hidden and 

    //Get value from the user 
    const userInput = inputField.value
    
    //Get the innerHTML of the taskTemplate to get a copy of a div 
    const taskTemplateEl = taskTemplate.innerHTML

    //Create a new div for when the user inputs various outputs of a task 
    const newTaskElement = document.createElement('div')


    //Get the checkbox and the H2
    taskTitle.textContent = userInput


    //Un-Hide the div and append the value to the div (taskTemplate)
    newTaskElement.innerHTML = taskTemplateEl
    taskTemplate.style.display = "block"
    displayContainer.appendChild(newTaskElement)

    //Reset the input value for more use
    inputField.value = ""


       
    



}


addTaskBtn.addEventListener('click', addTask)






























