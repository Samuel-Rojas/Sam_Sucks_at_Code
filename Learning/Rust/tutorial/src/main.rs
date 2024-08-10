use std::io;

fn main() {
    // Data Types:
    // Scalar, and Compound
    // Scalar: Integers, Floating-point, Booleans, Characters
    // Compound: Tuples, Arrays
    println!("Input a number:");

    let mut number = String::new();

    io::stdin()
        .read_line(&mut number)
        .expect("Failed to read line");

    let int_number: i32 = number.trim().parse().unwrap();

    println!("Hello {}", int_number + 5);
}
