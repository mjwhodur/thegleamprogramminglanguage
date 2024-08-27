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

### Exercise

FIXME: Add exercise

## Gleam is immutable by default

Let's talk about other languages for a moment.
Consider the following Python snippet (but this is true to the most programming languages - somehow):

```python
x = 1
x = x + 1
print(x)
```
That's a valid code. We expect the output to be 2. 

Let's try to do the same in Gleam:

```gleam

pub fn main() {
  let x = 1    // Declaring a variable x and assigning it the value of 1
  x = x + 1    // Trying to change the value of the variable x
  io.println(x)
}
```

Let's run the program using the `gleam run` command.

```
  │
5 │   x = x + 1
  │     ^ There must be a 'let' to bind variable to value

```

What happened here?
Well, the variables itself are immutable. Once a variable is assigned a value, it cannot be changed.
However, we can rebind the variable to a new value, and that is what compiler tries to convince us to.

We can rebind the variable to a new value by using the `let` keyword.

```gleam
pub fn main() {
  let x = 1
  let x = x + 1
  io.println(x)
}
```

The value itself is immutable, but the variable can be rebound to a new value.

### Exercise

Let's consider the following example from _The Gleam Language Tour_:

```gleam
import gleam/io

pub fn main() {
  let x = "Original"
  io.debug(x)

  // Assign `y` to the value of `x`
  let y = x
  io.debug(y)

  // Assign `x` to a new value
  let x = "New"
  io.debug(x)

  // The `y` still refers to the original value
  io.debug(y)
}
```

## Types and imports 
The Gleam syntax is rather simple. It is a statically typed language, and its type system is designed to be as simple as possible.
Let's talk about basic types in Gleam.

### Simple types
#### Numeric types
Gleam's `Int` type represents _whole_ numbers. When running on an Erlang VM, it has no arbitrary minimum and maximum value.
When running on JavaScript runtime, its value is limited to the maximum and minimum value of the JavaScript 64 bit floating point numbers.

Gleam's `Float` type represents floating point numbers - both in Erlang VM and in JavaScript they are represented as 64 bit floating point numbers.

```gleam
let x = 1       // Int
let y = 1.0    // Float
```

Under the JavaScript runtime, floats exceeding the range of 64 bit floating point numbers will be represented as `Infinity` or `-Infinity`.
Dividing two infinite numbers will result in `NaN`.

On BEAM, however, any overflow will result in an error. Division by zero will not overflow, but is instead defined to be zero.

Gleam has two modules supporting operations on those types: `gleam/int` and `gleam/float`.
We'll talk about modules in a moment.

#### Booleans
Boolean type is represented as `True` or `False`.
To manipulate those values we have: `||`, `&&`, `!` operators. 
Gleam's standard library contains `gleam/bool` module, which contains functions for working with booleans.

#### Strings
Gleam represents strings as text enclosed in double quotation marks. These strings can extend across multiple lines and include Unicode characters.

String concatenation is achieved using the `<>` operator.

Gleam supports several escape sequences within strings:

- \" for a double quote
    ```gleam
       let quote_example = "And he said to me \"Gleam is such a cool language!\", so I said \"Yes, it is!\""
       io.println(quote_example)
       // This will print: And he said to me "Gleam is such a cool language!", so I said "Yes, it is!"
    ```
- \\ for a backslash
    ```gleam
        let system_path = "C:\\Program Files\\Gleam"
        io.println(system_path)
        // This will print: C:\Program Files\Gleam
    ```
- \f for a form feed
    ```gleam
        let form_feed_example = "Hello\fWorld"
        io.println(form_feed_example)
        // This will print: Hello
        //                  World
    ```
- \n for a newline
    ```gleam
        let newline_example = "Hello\nWorld"
        io.println(newline_example)
        // This will print: Hello
        //                  World
    ```
- \r for a carriage return
    ```gleam
        let carriage_return_example = "Hello\rWorld"
        io.println(carriage_return_example)
        // This will print: World     
        // Notice that "Hello" is overwritten by "World"
    ```
- \t for a tab
    ```gleam
        let tab_example = "Hello\tWorld"
        io.println(tab_example)
        // This will print: Hello   World
    ```
- \u{xxxxxx} for a Unicode codepoint (where 'xxxxxx' is the hexadecimal representation)
    ```gleam
        let unicode_example = "Hello\u{1F600}"
        io.println(unicode_example)
        // This will print: Hello 😀
    ```

Gleam standard library contains `gleam/string` module, which contains functions for working with strings.


### Constants
Altough we've just said, that variables are immutable, there are constants.
Constants are declared using the `const` keyword. 

```gleam
const x = 1
```

Constants are immutable and cannot be changed. They have impact on the Gleam compiler optimizations.
It may be more efficient to use constants in some scenarios, but the performance may differ, depending on the runtime.

### Compound types
We've just covered simple types. Now, let's talk about compound types. 

#### Tuples
Unlike lists, tuples are collection of values of (possibly) different types.
Tuples may have any number of elements. Notice, they are declared using the `#` operator followed by brackets.

```gleam
let my_triple = #(1, "Hello", true)
let my_simple = #(23981746)
```
It is possible to declare an empty tuple, but it's not very useful.

```gleam
let my_empty_tuple = #()
```

Tuple elements may be accessed using the dot notation.

```gleam
let my_triple = #(1, "Hello", true)
let first_element = my_triple.0
let second_element = my_triple.1
let third_element = my_triple.2
```

Tuples are frequently employed to return multiple values (typically two or three) from a function. However, in many cases, using a custom type instead of a tuple can lead to clearer and more self-documenting code. We'll explore custom types in the next section.

#### Lists
Lists are collection of values of the same type. They are declared using the `[]` operator.

```gleam
let my_list = [1, 2, 3] // type: List(Int)
```

List is a generic type. Lists can be of any type - for example of custom types.
Lists are de-facto linked-lists, meaning, that it is efficient to add and remove elements from the front of the list.
Appending to the end of the list is not efficient, but it is possible.

```gleam
let my_list = [1, 2, 3] 
let second_list = [4, 5, 6]
let combined_list = [..my_list, ..second_list]
```
 Notice the `..` operator, is not called `spread operator`. It is a record constructor. 

#### Dictionaries
Although dictionaries are not available without importing them (unlike in i.e. Python), they are available in standard library.
We won't cover them thoroughly here, but let's remember, they are available.

```gleam
   import gleam/dict

  let dictionary = dict.new

  let scores =
    scores
    |> dict.insert("Bushra", 16)
    |> dict.insert("Darius", 14)
    |> dict.delete("Drew")

```
Operation on dict type, as usual, does not mutate the original dictionary, but returns a new dictionary.

#### Custom types
Similarly to other languages, Gleam allows you to define your own types.

```gleam
pub type Season {
  Spring
  Summer
  Autumn
  Winter
}
```
Custom type variants can contain additional data, and when they do, they're referred to as records.

Record fields can have labels, which, similar to function argument labels, can be optionally used when creating the record. 
These labels are typically employed for variants that define them.

It's common to encounter a custom type with a single variant holding data. This serves as Gleam's equivalent to structs or objects found in other programming languages.
```gleam
pub type SchoolPerson {
  Teacher(name: String, subject: String)
  Student(String)
}
```
Unlike other languages, Gleam does not support methods on custom types as variables created from it are immutable.


### Special
#### Nil
As Gleam does not have pointers, Nil in Gleam is a type. 
Nil is not a valid value of any other type. It's a type itself.

It's a special type that is returned by functions that do not return anything.
It's similar to `void` in C, or `None` in Python.
```gleam
    let result = io.println("Hello!")
    // result is of type Nil, because io.println does not return anything (it prints to the console)
```

#### Result
Similarly to Go, Gleam does not have exceptions. Instead, it uses the `Result` type to handle errors.
```gleam
    // ...omitted for brevity...

    // Returns Ok(Int) if the money is enough to buy an apple, otherwise returns Error(String) with a reason
    fn buy_apples(money: Int, price: Int) -> Result(Int, String) {
        case money >= price {
            true -> Ok(money - price)
            false -> Error("Not enough money")
        }
    }
    // ...
    io.println(buy_apples(10, 5)) 
    // This will print: Ok(5)
    io.println(buy_apples(5, 10)) 
    // This will print: Error("Not enough money")

```

#### Bit Array
#### Option 
Values in Gleam are not nullable. 
Standard library contains `gleam/option` module, which contains functions for working with Option type.
This type represents a value that may or may not be present.
FIXME: Lack of sensible example

#### Generic Custom Types
FIXME: Reword that
Like functions, custom types can also be generic, taking contained types as parameters.

Here a generic Option type is defined, which is used to represent a value that is either present or absent. This type is quite useful! The gleam/option module defines it so you can use it in your Gleam projects.

```gleam
pub type Option(inner) {
  Some(inner)
  None
}

// An option of string
pub const name: Option(String) = Some("Annah")

// An option of int
pub const level: Option(Int) = Some(10)

```


## Flow control, functions and modules

Gleam is probably your not first language, so you may be familiar with the concept of functions. 
In programming, a function is a reusable block of code that performs a specific task. Functions are fundamental building blocks in most programming languages, including Gleam. They help organize code, promote reusability, and make programs more modular and easier to understand.

In Gleam, functions are declared using the `fn` keyword.
```gleam
fn add(a: Int, b: Int) -> Int {
  a + b
}
```
Function can take arguments, and optionally return a value (technically speaking, it always returns a value - Nil, if no return value is specified).
In Gleam there is no `return` keyword. The value of the last expression in the function is returned.

Similarly to other languages, functions are values. They can be passed to other functions, returned from functions, stored in variables, etc.

As a value, functions has also a type: `fn(<arguments>) -> <return type>`.

Unlike some languages, Gleam cannot have functions with same names and different parameters.
In C, for example, it is possible to have two functions with same name, but different arguents - this is called function overloading.
_Footnote_: In C, function overloading yields creation of different functions, with different names during the compilation. This feature is called name mangling. The exact function name is mangled by the compiler to include the types of the arguments and put in place of the original function name.
In Erlang, it is possible to have two functions with same name, but different arities (number of arguments).

```gleam
    fn add(a: Float, b: Float) -> Float {
        a + b
    }

    // Uncommenting this will cause a compilation error
    //fn add(a: Int, b: Int) -> Int {
    //    a + b
    }
```

### Anonymous functions
FIXME: Add example

### Control flow - there is no if, while, for, etc.
FIXME: Pattern matching


### Modules
Similarly to Erlang and JavaScript, Gleam uses modules to organize code.
Functions, types, constants, etc. are declared in modules. And can be exported to be used in other modules.
In order to export a function, type, constant, etc. from a module, we need to declare it as `pub`.
```gleam
pub fn add(a: Int, b: Int) -> Int {
  a + b
}
```
Functions, types, can be imported from other modules.
FIXME: Elaborate on this - extend example to use the two separate modules.

FIXME: Add example
FIXME: Add Exercise - calculator
FIXME: Add Exercise - Advanced calculator



### Exercise

FIXME: Add exercise

## Gleam is immutable by default

Let's talk about other languages for a moment.
Consider the following Python snippet (but this is true to the most programming languages - somehow):

```python
x = 1
x = x + 1
print(x)
```
That's a valid code. We expect the output to be 2. 

Let's try to do the same in Gleam:

```gleam

pub fn main() {
  let x = 1    // Declaring a variable x and assigning it the value of 1
  x = x + 1    // Trying to change the value of the variable x
  io.println(x)
}
```

Let's run the program using the `gleam run` command.

```
  │
5 │   x = x + 1
  │     ^ There must be a 'let' to bind variable to value

```

What happened here?
Well, the variables itself are immutable. Once a variable is assigned a value, it cannot be changed.
However, we can rebind the variable to a new value, and that is what compiler tries to convince us to.

We can rebind the variable to a new value by using the `let` keyword.

```gleam
pub fn main() {
  let x = 1
  let x = x + 1
  io.println(x)
}
```

The value itself is immutable, but the variable can be rebound to a new value.

### Exercise

Let's consider the following example from _The Gleam Language Tour_:

```gleam
import gleam/io

pub fn main() {
  let x = "Original"
  io.debug(x)

  // Assign `y` to the value of `x`
  let y = x
  io.debug(y)

  // Assign `x` to a new value
  let x = "New"
  io.debug(x)

  // The `y` still refers to the original value
  io.debug(y)
}
```

## Types and imports 
The Gleam syntax is rather simple. It is a statically typed language, and its type system is designed to be as simple as possible.
Let's talk about basic types in Gleam.

### Simple types
#### Numeric types
Gleam's `Int` type represents _whole_ numbers. When running on an Erlang VM, it has no arbitrary minimum and maximum value.
When running on JavaScript runtime, its value is limited to the maximum and minimum value of the JavaScript 64 bit floating point numbers.

Gleam's `Float` type represents floating point numbers - both in Erlang VM and in JavaScript they are represented as 64 bit floating point numbers.

```gleam
let x = 1       // Int
let y = 1.0    // Float
```

Under the JavaScript runtime, floats exceeding the range of 64 bit floating point numbers will be represented as `Infinity` or `-Infinity`.
Dividing two infinite numbers will result in `NaN`.

On BEAM, however, any overflow will result in an error. Division by zero will not overflow, but is instead defined to be zero.

Gleam has two modules supporting operations on those types: `gleam/int` and `gleam/float`.
We'll talk about modules in a moment.

#### Booleans
Boolean type is represented as `True` or `False`.
To manipulate those values we have: `||`, `&&`, `!` operators. 
Gleam's standard library contains `gleam/bool` module, which contains functions for working with booleans.

#### Strings
Gleam represents strings as text enclosed in double quotation marks. These strings can extend across multiple lines and include Unicode characters.

String concatenation is achieved using the `<>` operator.

Gleam supports several escape sequences within strings:

- \" for a double quote
    ```gleam
       let quote_example = "And he said to me \"Gleam is such a cool language!\", so I said \"Yes, it is!\""
       io.println(quote_example)
       // This will print: And he said to me "Gleam is such a cool language!", so I said "Yes, it is!"
    ```
- \\ for a backslash
    ```gleam
        let system_path = "C:\\Program Files\\Gleam"
        io.println(system_path)
        // This will print: C:\Program Files\Gleam
    ```
- \f for a form feed
    ```gleam
        let form_feed_example = "Hello\fWorld"
        io.println(form_feed_example)
        // This will print: Hello
        //                  World
    ```
- \n for a newline
    ```gleam
        let newline_example = "Hello\nWorld"
        io.println(newline_example)
        // This will print: Hello
        //                  World
    ```
- \r for a carriage return
    ```gleam
        let carriage_return_example = "Hello\rWorld"
        io.println(carriage_return_example)
        // This will print: World     
        // Notice that "Hello" is overwritten by "World"
    ```
- \t for a tab
    ```gleam
        let tab_example = "Hello\tWorld"
        io.println(tab_example)
        // This will print: Hello   World
    ```
- \u{xxxxxx} for a Unicode codepoint (where 'xxxxxx' is the hexadecimal representation)
    ```gleam
        let unicode_example = "Hello\u{1F600}"
        io.println(unicode_example)
        // This will print: Hello 😀
    ```

Gleam standard library contains `gleam/string` module, which contains functions for working with strings.


### Constants
Altough we've just said, that variables are immutable, there are constants.
Constants are declared using the `const` keyword. 

```gleam
const x = 1
```

Constants are immutable and cannot be changed. They have impact on the Gleam compiler optimizations.
It may be more efficient to use constants in some scenarios, but the performance may differ, depending on the runtime.

### Compound types
We've just covered simple types. Now, let's talk about compound types. 

#### Tuples
Unlike lists, tuples are collection of values of (possibly) different types.
Tuples may have any number of elements. Notice, they are declared using the `#` operator followed by brackets.

```gleam
let my_triple = #(1, "Hello", true)
let my_simple = #(23981746)
```
It is possible to declare an empty tuple, but it's not very useful.

```gleam
let my_empty_tuple = #()
```

Tuple elements may be accessed using the dot notation.

```gleam
let my_triple = #(1, "Hello", true)
let first_element = my_triple.0
let second_element = my_triple.1
let third_element = my_triple.2
```

Tuples are frequently employed to return multiple values (typically two or three) from a function. However, in many cases, using a custom type instead of a tuple can lead to clearer and more self-documenting code. We'll explore custom types in the next section.

#### Lists
Lists are collection of values of the same type. They are declared using the `[]` operator.

```gleam
let my_list = [1, 2, 3] // type: List(Int)
```

List is a generic type. Lists can be of any type - for example of custom types.
Lists are de-facto linked-lists, meaning, that it is efficient to add and remove elements from the front of the list.
Appending to the end of the list is not efficient, but it is possible.

```gleam
let my_list = [1, 2, 3] 
let second_list = [4, 5, 6]
let combined_list = [..my_list, ..second_list]
```
 Notice the `..` operator, is not called `spread operator`. It is a record constructor. 

#### Dictionaries
Although dictionaries are not available without importing them (unlike in i.e. Python), they are available in standard library.
We won't cover them thoroughly here, but let's remember, they are available.

```gleam
   import gleam/dict

  let dictionary = dict.new

  let scores =
    scores
    |> dict.insert("Bushra", 16)
    |> dict.insert("Darius", 14)
    |> dict.delete("Drew")

```
Operation on dict type, as usual, does not mutate the original dictionary, but returns a new dictionary.

#### Custom types
Similarly to other languages, Gleam allows you to define your own types.

```gleam
pub type Season {
  Spring
  Summer
  Autumn
  Winter
}
```
Custom type variants can contain additional data, and when they do, they're referred to as records.

Record fields can have labels, which, similar to function argument labels, can be optionally used when creating the record. 
These labels are typically employed for variants that define them.

It's common to encounter a custom type with a single variant holding data. This serves as Gleam's equivalent to structs or objects found in other programming languages.
```gleam
pub type SchoolPerson {
  Teacher(name: String, subject: String)
  Student(String)
}
```
Unlike other languages, Gleam does not support methods on custom types as variables created from it are immutable.


### Special
#### Nil
As Gleam does not have pointers, Nil in Gleam is a type. 
Nil is not a valid value of any other type. It's a type itself.

It's a special type that is returned by functions that do not return anything.
It's similar to `void` in C, or `None` in Python.
```gleam
    let result = io.println("Hello!")
    // result is of type Nil, because io.println does not return anything (it prints to the console)
```

#### Result
Similarly to Go, Gleam does not have exceptions. Instead, it uses the `Result` type to handle errors.
```gleam
    // ...omitted for brevity...

    // Returns Ok(Int) if the money is enough to buy an apple, otherwise returns Error(String) with a reason
    fn buy_apples(money: Int, price: Int) -> Result(Int, String) {
        case money >= price {
            true -> Ok(money - price)
            false -> Error("Not enough money")
        }
    }
    // ...
    io.println(buy_apples(10, 5)) 
    // This will print: Ok(5)
    io.println(buy_apples(5, 10)) 
    // This will print: Error("Not enough money")

```

#### Bit Array
#### Option 
Values in Gleam are not nullable. 
Standard library contains `gleam/option` module, which contains functions for working with Option type.
This type represents a value that may or may not be present.
FIXME: Lack of sensible example

#### Generic Custom Types
FIXME: Reword that
Like functions, custom types can also be generic, taking contained types as parameters.

Here a generic Option type is defined, which is used to represent a value that is either present or absent. This type is quite useful! The gleam/option module defines it so you can use it in your Gleam projects.

```gleam
pub type Option(inner) {
  Some(inner)
  None
}

// An option of string
pub const name: Option(String) = Some("Annah")

// An option of int
pub const level: Option(Int) = Some(10)

```


## Flow control, functions and modules






