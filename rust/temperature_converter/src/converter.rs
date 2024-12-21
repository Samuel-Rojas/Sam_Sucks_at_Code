use std::io;

fn main() {

    prompt();

}

fn prompt() {

    println!("Enter the Desired Unit of Conversion: Celsius (c) | Farenheit (f) | Kelvin (k)");
    let mut desired_unit = String::new();
    io::stdin().read_line(&mut desired_unit).expect("Did not enter the unit correctly, please just one letter");
    println!("Desired Unit: {}", desired_unit);


    println!("Enter Temperature:");
    let mut temp_input = String::new();
    io::stdin().read_line(&mut temp_input).expect("Did not enter correctly");
    let temperature_input: i32 = temp_input.trim().parse().expect("did not parse correctly");


    if desired_unit.trim().to_lowercase() == "c" {
        to_celsius(temperature_input);
    }

}

fn to_celsius(temp: i32){
    let formula: f32 = (temp - 32) * 5/9;
    // let dec_formula = formula as f32;
    println!("Celsius: {}", formula);
    // println!("{}", dec_formula);
    

   
}


