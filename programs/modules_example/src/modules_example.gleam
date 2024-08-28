import calc.{sum}
import gleam/io

pub fn main() {
  io.println("Hello from modules_example!")

  sum(1, 2)
}
