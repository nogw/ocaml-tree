open Lib
(* |> [%to_yojson: string array]
|> Yojson.Safe.to_string *)

let () =
  Fmt.set_utf_8 Fmt.stdout true;
  Fmt.set_style_renderer Fmt.stdout `Ansi_tty;
  let dir = Utils.directory in
  dir |> Utils.list_root_files |> Array.to_list |> Utils.folder_tree dir
;;
