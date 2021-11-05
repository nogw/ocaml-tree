let directory = Sys.getcwd ()
let list_root_files dir = Sys.readdir dir
let rec repeat s n = if n = 0 then "" else s ^ repeat s (n - 1)

(* ["bin","lib","dune-project",".ocamlformat","_build"] *)

let rec print_dir path ?(tab = 0) dir =
  let is_dir file =
    let path' = path ^ "/" ^ file in
    match Sys.is_directory path' with
    | true ->
      Printf.printf "%s└── %s\n" (repeat "   " tab) file;
      print_dir path' ~tab:(succ tab) (list_root_files path' |> Array.to_list)
    | false -> Printf.printf "%s└── %s\n" (repeat "   " tab) file
  in
  match dir with
  | [] -> exit 0
  | [ head ] -> is_dir head
  | head :: tail ->
    is_dir head;
    print_dir path ~tab tail
;;
