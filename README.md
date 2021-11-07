# ocaml-tree

a simple pretty-print tree structure folder

```
├── bin
│   ├── dune
│   └── main.ml
├── lib
│   ├── dune
│   ├── utils.ml
│   └── teste
│       └── teste
│           └── teste
│               ├── teste
│               │   └── teste
│               ├── teste1
│               │   └── teste
│               │       └── teste
│               └── teste2
│                   └── teste
│                       └── teste
└── dune-project
```

---

## usage

```
git clone https://github.com/nogw/ocaml-tree
cd ocaml-tree
dune build
cd _build/default/bin
chmod u+x tree.exe
sudo mv tree.exe /usr/local/bin/
tree.exe
```