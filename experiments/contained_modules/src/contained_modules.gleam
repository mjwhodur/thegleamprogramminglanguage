import container/mod
import gleam/io

pub fn main() {
  io.println("Hello from contained_modules!")
  mod.hello
}
