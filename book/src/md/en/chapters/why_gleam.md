# Why Gleam?

## What Gleam is?

- modern, functional, statically typed language
- language targeting the Erlang VM (BEAM)
- language that compiles to JavaScript

## Features of Gleam

### Dual Targeting

Gleam is targeting Erlang VM (BEAM) and Javascript.

Javascript is a very popular language and has a lot of libraries and frameworks.
Thus, Gleam may leverage these libraries and frameworks. JS lacks however static
typing. Gleam, among other things, brings static typing to JS. Javascript has
multiple implementations (Node.js, Deno, Bun, etc.). Javascript is used in
frontend and backend. According to DistantJob, there are 13.8 million Javascript
developers worldwide.

BEAM is a powerful platform for building distributed, fault-tolerant, scalable
and maintainable systems. It has been used in production for over 20 years.
Created in Ericsson it was powering telecom systems where reliability was a
must. It's still powering telecom systems today. But not only. Notable users
are, among others, WhatsApp, AdRoll, Nintendo, Mastercard and many more.

Some Gleam libraries are targeting both BEAM and JS. Some of them are only
targeting BEAM. Some of them are only targeting JS.

### Static typing

Gleam is statically typed. It brings static typing to BEAM and to JS. What does
it mean? In general, Erlang is a dynamically typed language. It means that the
variable type is not known at compile time, but at runtime. Gleam brings
static typing to BEAM. Type is known at compile time which helps to catch errors
earlier - at compile time. Overall, software is safer.

### Modern syntax

Gleam syntax is easier to read and write than Erlang. Let's compare those two
languages in action.

Here is a simple Erlang module for factorial:

```erlang
% Erlang module for factorial with tail call optimization
-module(factorial).
-export([factorial/1]).

factorial(N) when N >= 0 -> factorial(N, 1).

factorial(0, Acc) -> Acc;
factorial(N, Acc) when N > 0 -> factorial(N - 1, N * Acc).
```

And here is a simple Gleam module for factorial:

```gleam
// Gleam module for factorial
pub fn factorial(n: int) -> int {
    factorial_helper(n, 1)
}

fn factorial_helper(n: int, acc: int) -> int {
    match n {
        0 => acc,
        _ => factorial_helper(n - 1, n * acc),
    }
}
```

Those two examples do exactly the same thing. The first one is written in
Erlang, the second one in Gleam.

Syntax is more readable and easier to write, especially for developers coming
from modern languages like Python, Go, Rust, Elixir or Kotlin.

Gleam syntax may look similar to Rust.

### Functional programming and Immutability

Gleam, like Erlang, embraces immutability for its variables. Once a value is
assigned, it remains constant throughout its lifetime. This immutability is a
cornerstone of functional programming, a paradigm that Gleam adheres to. In this
approach, programs are constructed by applying and composing functions to
transform immutable data.

These functions operate similarly to their mathematical counterparts: they
accept inputs and produce outputs in a predictable manner. This design
philosophy contributes to code that is easier to reason about, less prone to
side effects, and more resistant to certain types of bugs.

## Gleam as a first programming language

Learning Gleam as a first programming language may not be such a good idea.
There are few reasons for that. It targets specific platform (Erlang VM) which
is not trivial. It's a functional language which may be hard to grasp for
beginners. It's a statically typed language which may be hard to grasp for
beginners.

### Gleam has (yet) small community and ecosystem

Stabilized in 2024, it is a very fresh language. There are (still) not many
resources available. Gleam is a very new ecosystem,
and a lot of tools and functionalities are not yet available, or they may not be
so stable as their Elixir/Erlang counterparts.

### Gleam is a functional programming language

Functional paradigm may be hard to grasp for beginners. It is somehow different
what we used to. It is run on BEAM VM which is not so trivial in the beginning
as well as Node.js runtime. It's a rather low-level language.

### Gleam has (yet) small number of libraries and frameworks

While there is abundance of libraries and frameworks for Javascript, Erlang or
Elixir, there are few libraries and frameworks for Gleam. This number is slowly
growing though. It may be hard to find a library or framework for your needs.
Sometimes you may have to depend on Erlang or Elixir libraries and frameworks.