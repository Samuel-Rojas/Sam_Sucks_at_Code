import React from "react"
import '/src/Counter.css'

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
        <>
            <p>Current Integer: {count} </p>
            <button className="incrementBtn" type="button" onClick={increment}> 

            </button>
            <button className="decrementBtn" type="button" onClick={decrement}>

            </button>

        </>
    )
}