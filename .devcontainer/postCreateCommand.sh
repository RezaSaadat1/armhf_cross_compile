#!/bin/bash

# Install Rust using rustup-init with the -y flag to automate the installation
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Add Rust to the current shell session
source $HOME/.cargo/env

# Add the armv7 target
rustup target add armv7-unknown-linux-gnueabihf

# Install cross and cargo-make
cargo install cross cargo-make
