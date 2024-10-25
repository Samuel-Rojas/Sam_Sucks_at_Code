use iced::{Application, Settings, executor, Command, Element};
use iced::widget::Text;

fn main() -> iced::Result {
    HelloWorld::run(Settings::default())
}

struct HelloWorld;

impl Application for HelloWorld {
    type Executor = executor::Default;
    type Message = ();
    type Theme = iced::Theme;
    type Flags = ();

    fn new(_flags: ()) -> (HelloWorld, Command<Self::Message>) {
        (HelloWorld, Command::none())
    }

    fn title(&self) -> String {
        String::from("Hello World - Iced")

    }

    fn update(&mut self, _message: Self::Message) -> Command<Self::Message> {
        // No messages to handle in this simple example
        Command::none()
    }

    fn view(&self) -> Element<Self::Message> {
        Text::new("Hello, world!").into()
    }
b
}
