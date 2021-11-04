let directory = Sys.getcwd ()
let list_root_files dir = Sys.readdir dir

(* ["bin","lib","dune-project",".ocamlformat","_build"] *)

let rec print_dir path dir =
  let is_dir file =
    print_endline file;
    match Sys.is_directory file with
    | true ->
      print_dir (path ^ "/" ^ file) (list_root_files (path ^ "/" ^ file) |> Array.to_list)
    | false -> print_endline file
  in
  match dir with
  | [] -> failwith "empty directory"
  | [ head ] -> is_dir head
  | head :: tail ->
    is_dir head;
    print_dir path tail
;;
