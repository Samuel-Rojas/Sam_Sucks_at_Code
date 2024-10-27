use std::io;

fn main() {
    println!("Hello, world!");

    prompt();

}

fn prompt() {
    println!("Enter the Current Unit of Temperature: Celsius (c) | Farenheit (f) | Kelvin (k)");
    let mut current_unit = String::new();
    io::stdin().read_line(&mut current_unit).expect("Did not enter correctly");
    println!("Current Unit: {}", current_unit);


    println!("Enter Temperature:");
    let mut temp_input = String::new();
    io::stdin().read_line(&mut temp_input).expect("Did not enter correctly");
    let temperature_input: i32 = temp_input.trim().parse().expect("did not parse correctly");
    println!("please work {}", temperature_input);
}
