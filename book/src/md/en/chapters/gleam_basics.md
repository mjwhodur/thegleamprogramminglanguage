# Gleam Basics

## First Gleam program

A book about a programming language cannot exist without a "Hello, World!" program. So, let's write one in Gleam.

First, let's create a project. Gleam programs are organized in projects.
Open your terminal, navigate to the directory where you want to create your project and run:

```sh
$ gleam new hello_world
$ cd hello_world
```

In the created directory you will find src directory, test directory, gleam.toml file and README.md file. Let's now focus on the src directory.

```
hello_world/
├── src/
│   └── hello_world.gleam
├── test/
│   └── hello_world_test.gleam
├── gleam.toml
└── README.md

Catalog structure of the project
```

In the src directory, you will find the hello_world.gleam file. Let's open it in your favorite editor. 

```gleam 
import gleam/io

pub fn main() {
  io.println("Hello from hello_world!")
}
```

It's our first program. It was created by the `gleam new` command.

Let's change the content of the file to the following:

```gleam 
import gleam/io

pub fn main() {
  io.println("Hello, World!")
}
```

Now, we have a program that prints "Hello, World!" to the console.

To run the program, you can use the `gleam run` command.

```sh
$ gleam run
```

Gleam will compile the program and run it.
```
> $ gleam run
  Resolving versions
Downloading packages
 Downloaded 2 packages in 0.09s
  Compiling gleam_stdlib
  Compiling gleeunit
  Compiling hello_world
   Compiled in 0.90s
    Running hello_world.main
Hello, World!
```

What happened here?
1. Gleam compiler resolved the versions of the dependencies.
1. Gleam compiler compiled the program with the dependencies.
1. Gleam compiler ran the program.

That was our first Gleam program! 

Let's now focus on the content of the file.
```gleam
import gleam/io
```
This line tells the compiler to import the io module from the gleam/io package.
`gleam.io` package contains various functions, but we're importing the `println` function from it. You'll learn more about modules and packages later in the book. Importing works similar to the `import` statement in other programming languages, such as JavaScript, Python or Go. 

Following, we have function declaration:
```gleam
pub fn main() {
  io.println("Hello, World!")
}
```
Gleam programs are organized in modules. The `main` function is the entry point of the program. It is the function that will be executed when the program is run. Although the Erlang VM does not require a special function to be the entry point of the program, Gleam does. Gleam organizes the code into modules, just like BEAM does. 

The `pub` keyword declares an exported function. This function will be available from the outside of a module. 

```
Source code for this part is available [here](https://github.com/mjwhodur/thegleamprogramminglanguage/tree/main/programs/hello_world)
```