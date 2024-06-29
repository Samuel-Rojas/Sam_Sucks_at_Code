
const buttonSubmit = document.getElementById('btn-submit');
const result = document.getElementById('result');
const resetBtn = document.getElementById('btn-reset');

const calculateBMI = () => {
    //Inside handles the logic and returns a value to display in the result 
    const weightInput = document.getElementById('weight');
    const heightInput = document.getElementById('height');
    const selectWeight = document.getElementById('weight-unit');
    const selectHeight = document.getElementById('height-unit');
    let getSelectWeight = selectWeight.value;
    let getSelectHeight = selectHeight.value;
    let inputWeightValue = weightInput.value;
    let inputHeightValue = heightInput.value;

    //conversion logic
    //Check if the user inputs lbs and ft 
    if(getSelectWeight !== "kg" && getSelectHeight !== "m"){
        inputWeightValue = inputWeightValue * 0.453592;
        inputHeightValue = inputHeightValue / 100;
        console.log(inputWeightValue);
        console.log(inputHeightValue);
    }

    //logic for the calculation
    let bmiValue = inputWeightValue / (inputHeightValue * inputHeightValue);
    
    //Display the results to the page
    result.innerHTML = `Your BMI is <strong>${bmiValue.toFixed(2)}</strong>`;
    console.log(inputWeightValue);
    console.log(inputHeightValue);

}

const reset = () => {
    inputHeightValue = "";
    inputWeightValue = "";
    getSelectHeight = "";
    getSelectWeight = "";
    result.innerHTML ="";
}

//Event Listener Goes here 

buttonSubmit.addEventListener('click', (event) => {
    event.preventDefault();
    calculateBMI();

});

resetBtn.addEventListener('click', reset);

