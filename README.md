## Pokedex App
[![Tuist badge](https://img.shields.io/badge/Powered%20by-Tuist-blue)](https://tuist.io)

Pretty much what the title says. 

This Application uses Tuist in order to generate the Xcode project. After being mentally scarred from Xcode's dependency management tool, I had adopted tuist. If you do not have tuist installed, TLDR the Tuist Docs, just run this command in your terminal. 

`curl -Ls https://install.tuist.io | bash`

Once cloned to your repository perform the two operations right at the root of the cloned directory. 

`tuist fetch` - Will fetch and create the latest dependency graph from the specifications of the `Dependencies.swift` file.

`tuist generate` - Will generate the Xcode project so you don't have to deal with that mess. 

There are three local libraries in this repository all with the purpose of keeping the main project module as business logic(y) as possible.
 - *Loadable* - Very simple generic type which allows for a temporary view to be shown if object is not loaded yet.
 - *PokemonTypes* - Provides an enum to specify which Pokemon Type has what
 - *Requests* - Repository of requests to call from PokeApi as well as providing Mock responses for Live Previews.
