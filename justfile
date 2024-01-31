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
  flutter build apk --target-platform android-arm,android-arm64,android-x64 --release --split-per-abi

