import React from "react"


export default function Counter() {

const [count, setCount] = React.useState(0);

    function increment(){
        setCount(count + 1);
    }
    

    function decrement(){

        if(count > 0){
            setCount(count - 1);
        }
    }

    
    return(
        <div className="counter-container">
            <h1 className="title-counter">Current Integer: {count} </h1>
            <button className="incrementBtn" type="button" onClick={increment}> 
                Add
            </button>
            <button className="decrementBtn" type="button" onClick={decrement}>
                Subtract
            </button>

        </div>
    )
}