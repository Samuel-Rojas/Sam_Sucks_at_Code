fn main() {
    let x: i32 = 2;
    let y: i32 = 10;

    {
        let y: i32 = 2;
        println!("The x value is {} and the y value is {}", x, y);
    }

    println!("the value of x {} and the y value is {}", x , y);
    //Hello world
}
    