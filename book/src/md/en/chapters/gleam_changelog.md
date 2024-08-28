# Gleam Changelog

```
FIXME: This is a stub.
```

# 1.0.0
On 4th of March 2024, Gleam 1.0.0 was released. 
It's the first version of the language that was released as stable.
As Gleam follows semantic versioning, backward compatibility is guaranteed.
The language creators reserved the right to break this rule for security and soundness reasons.

# 1.1.0
This version added support for Bun, and Rebar3. Julian Schurhammer optimized the Gleam compiler
targeting the JavaScript target.

It added the feature of @internal attribute. It makes the type or value private to the module.
The compiler also got improvements in the tree-shaking mechanism. 

# 1.2.0
- The compiler emits warning for unreachable code. 
- Compiler prevents module name collisions.
- The compiler warns about redundant pattern matching
- And it gets a useful warning for JS developers (Gleam does not have `===` operator)

# 1.3.0
- Updated Erlang code generation to escape functions, types, and record constructors that clash with new keywords 'maybe' and 'else' in Erlang/OTP 27.

# 1.4.0
- New shorthand syntax for labels 
- Improved targeted documentation
- The `<>` string concatenation operator can now be used in constant expressions.
- Case correction (snake_case)

