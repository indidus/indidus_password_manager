default: dep

alias c := clean
alias i := install_tools

# Get dependencies for flutter and rust
dep:
  flutter pub get


# Generated rust bindings for flutter
frb:
  flutter_rust_bridge_codegen generate

install_tools:
  cargo install just
  cargo install cargo-tree

clean_flutter:
  flutter clean

clean_cargo: 
  cargo clean --manifest-path ./rust/Cargo.toml

tree:
  cargo tree --manifest-path ./rust/Cargo.toml

# Clean all the generated files during the build process by flutter and cargo
clean: clean_flutter clean_cargo && dep

abb: clean
  flutter build appbundle --target-platform android-arm,android-arm64,android-x64 --release

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
