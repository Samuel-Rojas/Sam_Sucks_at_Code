
const buttonSubmit = document.getElementById('btn-submit');
const result = document.getElementById('result');

const calculateBMI = () => {
    //Inside handles the logic and returns a value to display in the result 
    const weightInput = document.getElementById('weight');
    const heightInput = document.getElementById('height');

    const getWeightValue = weightInput.value;
    const getHeightValue = heightInput.value;

    //logic
    let bmiValue = getHeightValue/ (getWeightValue * getWeightValue);
    
    result.innerHTML = `Your BMI is <strong>${bmiValue}</strong>`;
    console.log(getHeightValue);
    console.log(getWeightValue);

}

//Event Listener Goes here 

buttonSubmit.addEventListener('click', (event) => {
    event.preventDefault();
    calculateBMI();

});

