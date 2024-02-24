default: dep

alias c := clean
alias cf := clean_flutter
alias cc := clean_cargo
alias cac := clean_all_cargo
alias cu := cargo_unused

alias i := install_tools
alias uc := update_cargo

# Get dependencies for flutter and rust
dep:
  flutter pub get

# Generate the splash screen for the flutter app
splash:
  dart run flutter_native_splash:create

# Generated rust bindings for flutter
frb:
  flutter_rust_bridge_codegen generate

# Install the tools required for the project
install_tools:
  cargo install just
  cargo install cargo-tree
  cargo install cargo-features-manager
  cargo install cargo-machete
  cargo install cargo-features-manager

cargo_unused:
  cargo machete rust

# Clean the flutter project
clean_flutter: && dep
  flutter clean

# Clean the rust project
clean_cargo: 
  cargo clean --manifest-path ./rust/Cargo.toml

# Show the dependency tree for the rust project
tree:
  cargo tree --manifest-path ./rust/Cargo.toml

# Clean all the generated files during the build process by flutter and cargo
clean: clean_flutter clean_cargo

# Build the flutter app bundle
abb: clean
  flutter build appbundle --target-platform android-arm,android-arm64,android-x64 --release

# Build the flutter apk
apk: clean
  flutter build apk --release --split-per-abi --target-platform android-arm,android-arm64,android-x64 

# Add command for sqlx

# Add command to update all cargo
update_cargo:
  cargo update --manifest-path ./rust/utils/Cargo.toml
  cargo update --manifest-path ./rust/structs/Cargo.toml
  cargo update --manifest-path ./rust/sqlite_wrapper/Cargo.toml
  cargo update --manifest-path ./rust/crudlf_core/Cargo.toml
  cargo update --manifest-path ./rust/crudlf_derive/Cargo.toml
  cargo update --manifest-path ./rust/Cargo.toml

# Add command to clean all cargo
clean_all_cargo:
  cargo clean --manifest-path ./rust/utils/Cargo.toml
  cargo clean --manifest-path ./rust/structs/Cargo.toml
  cargo clean --manifest-path ./rust/sqlite_wrapper/Cargo.toml
  cargo clean --manifest-path ./rust/crudlf_core/Cargo.toml
  cargo clean --manifest-path ./rust/crudlf_derive/Cargo.toml
  cargo clean --manifest-path ./rust/Cargo.toml
