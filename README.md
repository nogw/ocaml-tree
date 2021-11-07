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

## Installation

```
git clone https://github.com/nogw/ocaml-tree
cd ocaml-tree
dune build
cd _build/default/bin
chmod u+x tree.exe
sudo mv tree.exe tree
sudo mv tree /usr/local/bin/
tree
```

---

## Usage

print current directory: <br/>
```tree```

print current directory with colors <br/>
```tree -c```

imprimir outro diretório sem abri-lo
```
tree -c -p "../../Desktop
or
tree -c --path="../../Desktop

(flag "c" is optional)
```