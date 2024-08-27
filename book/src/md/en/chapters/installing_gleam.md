# Installing Gleam with Tools

Installing Gleam is a rather straightforward process. The language is available for most popular operating systems, making it accessible to a wide range of developers. 

Gleam is written in Rust.

In the following sections, we'll cover the installation process for different operating systems and package managers, ensuring you can get started with Gleam quickly and easily.

## Installing the Gleam Toolkit
### Linux
```
FIXME: This section is currently a stub. You can help by expanding it.
```

### Windows

For users on amd64 Windows, the simplest installation method is to download a precompiled version of the Gleam compiler. These prebuilt binaries are available on the official Gleam GitHub releases page.

To install Gleam using this method:

1. Visit the [Gleam releases page on GitHub](https://github.com/gleam-lang/gleam/releases).
2. Find the latest release version.
3. Download the appropriate file for your operating system:
   - For Windows: `gleam-v[version]-pc-windows-msvc.zip`
4. Extract the downloaded archive.
5. Move the `gleam` executable to a directory in your system's PATH.

This method ensures you have the latest stable version of Gleam without the need for additional package managers or build tools.

### macOS
#### Using Homebrew

For macOS users, one of the easiest ways to install Gleam is through Homebrew, a popular package manager for macOS.

If you don't have Homebrew installed, you can install it by following the instructions on the [official Homebrew website](https://brew.sh/).

Once you have Homebrew set up, installing Gleam is as simple as running the following command in your terminal:

```sh
brew install gleam
```

Homebrew will handle the installation process. It will download the latest version of Gleam and install it on your system. 

Gleam compiles to Erlang code or Javascript code. Not all libraries are available for both. This book will focus mostly on the Erlang code.

Homebrew will install Erlang alongside Gleam automatically, though it can be manually installed by running the following command:
```sh
brew install erlang
```


### Building from Source

The compiler is written in the Rust programming language and so if you wish to build Gleam from source you will need to install the Rust compiler.

To install the newest Rust compiler you can run the following command:
```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Then issue the following commands:

```sh
# Download the Gleam source code git repository
cd /tmp
git clone https://github.com/gleam-lang/gleam.git --branch $THE_LATEST_VERSION
cd gleam

# Build the Gleam compiler. This will take some time!
make install

# Verify the compiler is installed
# Prints "gleam $VERSION"
gleam --version
```

As of writing, the newest version of Gleam is v1.4.1

## Installing Erlang
### Linux
```
FIXME: This section is currently a stub. You can help by expanding it.
```

### Windows
#### Using Chocolatey
With Chocolatey installed on your computer run the following:

```sh
choco install erlang
```
#### Using Scoop
With Scoop installed on your computer run the following:

```sh
scoop install erlang
```

### macOS
If Gleam was installed with Homebrew, Erlang will be installed automatically.
In case you need to install it manually, you can run the following command:

```sh
brew install erlang
```

In case you would like to upgrade Erlang, you can run the following command:
```sh
brew upgrade erlang
```

## Installing Rebar3
Rebar3 is a build tool for Erlang. While it is not necessarily required to install Rebar3 to use the Gleam compiler, Erlang-based dependencies will require it. 

### Linux

### Windows

### macOS

#### Using Homebrew
```sh
brew install rebar3
```

