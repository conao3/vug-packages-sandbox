# Repository instructions

Keep the package tree small for fast merge-policy acceptance tests. Use `vug record format-record --file <file> --write` to format records in the Nix development shell. Run `nix develop --command make check` before committing. Use `nix fmt` for Nix files. Update and verify the Actions lockfile with `gh actions-lock --no-interactive` and `gh actions-lock --verify` when changing workflow dependencies.
