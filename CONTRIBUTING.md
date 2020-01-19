# Contributing to Cloak

## Setup development environment

**Windows**

- Install [Chocolatey](https://chocolatey.org/install)
- Install `cabal v3` with `choco install cabal` from an admin PowerShell
- Install `ghc 8.6.5` with `choco install ghc --version 8.6.5` from an admin PowerShell
- Make sure that you can run the `cabal` and `ghc` commands. If not, you'll need to add their paths to your PATH environment variable. Generally, they will be:
  - `C:\ProgramData\chocolatey\lib\ghc\tools\ghc-8.6.5\bin` for `ghc`
  - `C:\Users\nikit\AppData\Roaming\cabal\bin` for `cabal`
- After installing these tools, run the following commands to install additional tooling for linting and styling:
  - `cabal install hspec-discover`
  - `cabal install hlint`
  - `cabal install ormolu`

## Setting up an IDE

- Clone the [`haskell-ide-engine` repo](https://github.com/haskell/haskell-ide-engine) somewhere and install it for GHC 8.6.5:
  - `git clone https://github.com/haskell/haskell-ide-engine && cd haskell-ide-engine`
  - `./cabal-hie-install hie-8.6.5`
  - `./cabal-hie-install data`
- Install the [VSCode HIE server extension](https://marketplace.visualstudio.com/items?itemName=alanz.vscode-hie-server) for Visual Studio Code.

## Learning the libraries used in the project

_(Hint: Click on the links in the headings to go to the API docs of the libraries)_

### Parsing - [`megaparsec`](https://hackage.haskell.org/package/megaparsec-8.0.0)

A nice, extensive, tutorial on `parsec` (the predecessor of `megaparsec`) can be found [here](https://jakewheat.github.io/intro_to_parsing/).
Most of it applies to the usage of `megaparsec`.

### Testing - [`hspec`](https://hackage.haskell.org/package/hspec)

The [official site](http://hspec.github.io/) of `hspec` has a nice tutorial and more resources.
