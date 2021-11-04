open Lib
(* |> [%to_yojson: string array]
|> Yojson.Safe.to_string *)

let () =
  let dir = Utils.directory in
  dir |> Utils.list_root_files |> Array.to_list |> Utils.print_dir dir
;;
