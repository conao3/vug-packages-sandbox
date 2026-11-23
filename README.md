# vug packages sandbox

Use this small package tree to exercise the vug merge policy with fork pull requests. It contains hello, make, musl, binutils, and the bootstrap seed from vug-packages. Its CI runs the record tree validator.

Run `nix develop --command make check` to validate the tree, or `nix run` from the repository root. See the vug gate README for the end-to-end acceptance procedure.

The imported package records and seed retain the upstream license in `LICENSE.records`. Repository tooling is licensed under Apache-2.0.
