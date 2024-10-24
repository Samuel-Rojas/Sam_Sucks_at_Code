
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

    println!("y or n");

    let mut confirmation = String::new();

    io::stdin().read_line(&mut confirmation).expect("Failed to read line");


    if confirmation == "y" {
        //proceed with logic 
        calculation(num_one, num_two);
    } else {
        restart_calculator();
    }
}

fn restart_calculator(){
    println!("Enter with the first integer");

    let mut input_one = String::new();

    io::stdin().read_line(&mut input_one).expect("Failed to read line");

    // let num: f32 = input.trim().parse().expect("Please type a integer!");

    println!("Enter the second integer");

    let mut input_two = String::new();

    io::stdin().read_line(&mut input_two).expect("Failed to read line");

    println!("Just to confirm, are these the number were working with {} and {}", input_one, input_two);

    println!("y or n");

    let mut confirmation = String::new();

    io::stdin().read_line(&mut confirmation).expect("Failed to read line");
}


fn calculation(one: i32, two: i32){

    // prinln!("What operation, (a), (s), (m), (d)");

    // let mut operation = String::new();

    // io::stdin().read_line(&mut opeartion).expect("Failed to read line");




}


fn addition(one: i32, two: i32){
    let sum = one + two;
    println!("{}", sum);
}
