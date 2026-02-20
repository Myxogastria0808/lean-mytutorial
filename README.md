## Setup

1. Add `flake.nix`, `.envrc` and `.gitignore`

- `flake.nix`

```nix
{
  description = "lean flake sample";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    inputs:
    inputs.flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = inputs.nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            # language
            # lake (lean package manager) is included lean4 nixpkgs.
            lean4
            # lean version manager
            elan
          ];
        };
      }
    );
}
```

- `.envrc`

```.envrc
use flake
```

- `.gitignore`

```
# Nix
/.direnv

# Lean
/.lake

```

2. Leanのプロジェクトの作成

- 実行可能ファイル付きで初期化

```sh
lake init . exe
```

- ライブラリとして作る場合

```sh
lake init . lib
```

3. Leanのビルド

```sh
lake build
```

すると、以下のパスにバイナリが生成される。

```sh
./<project-name>/.lake/build/bin/
```

4. Leanの実行

```sh
lake exe <project-name>
```

## Dependency

lean ... language

lake ... lean package manager

elan ... lean version manager

## References

https://chatgpt.com/c/6991763f-ee3c-83aa-ba25-b4f7a4ce51ab

## Lean References

https://speakerdeck.com/unaoya/zheng-ming-zhi-yuan-xi-leanniru-men-siyou
