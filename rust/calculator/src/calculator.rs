
use std::io;

fn main() {
    //Global Variables for the inputs 

    conversation();

}

//This is just for integers right now, have to expand on doubles and floats for later use
fn conversation(){
    println!("Enter with the first integer");

    let mut input_one = String::new();
    io::stdin().read_line(&mut input_one).expect("Failed to read line");

    let num_one: i32 = input_one.trim().parse().expect("Please type a integer!");

    println!("Enter the second integer");

    let mut input_two = String::new();
    io::stdin().read_line(&mut input_two).expect("Failed to read line");

    let num_two: i32 = input_two.trim().parse().expect("Please type an integer!");

    println!("Just to confirm, are these the number were working with {} and {}", input_one, input_two);

    println!("Enter (y) to confirm or (n) for re-entry");

    let mut confirmation = String::new();
    io::stdin().read_line(&mut confirmation).expect("Failed to read line");


    if confirmation.trim().to_lowercase() == "y" {
        //proceed with logic 
        calculation(num_one, num_two);
    } else {
        restart_calculator();
    }
}

fn restart_calculator(){
    conversation();
}


fn calculation(one: i32, two: i32){

    println!("What is the operation?");
    println!("(1). Addition");
    println!("(2). Subtraction");
    println!("(3). Multiplication");
    println!("(4). Division");


    let mut operation = String::new();
    io::stdin().read_line(&mut operation).expect("Failed to read line");
    let operation_type: i32 = operation.trim().parse().expect("Please type an integer!");

    if operation_type == 1{
        addition(one, two);
    } else if operationType == 2 {
        subtraction(one,two);
    } else if operationType == 3 {
        multiplication(one,two);
    } else {
        division(one,two);
    }


}


fn addition(one: i32, two: i32){
    let sum = one + two;
    println!("Output: {}", sum);
}

fn subtraction(one: i32, two: i32){
    let sum = one - two;
    println!("Output: {}", sum);
}

fn multiplication(one: i32, two: i32){
    let sum = one * two;
    println!("Output: {}", sum);
}

fn division(one: i32, two: i32){
    let sum = one / two;
    println!("Output: {}", sum);

}