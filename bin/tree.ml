open Lib
open Cmdliner

let path =
  let info = Arg.info [ "p"; "P"; "path" ] ~docv:"PATH" ~doc:"path to directory" in
  Arg.value (Arg.opt (Arg.some Arg.dir) None info)
;;

let color =
  let info = Arg.info [ "c"; "C"; "color" ] ~doc:"print with colors" in
  Arg.value (Arg.flag info)
;;

let cmdliner_term =
  let tree f p =
    let path =
      match p with
      | None -> Utils.directory
      | Some p -> p
    in
    path |> Utils.list_root_files |> Array.to_list |> Utils.folder_tree path ~colors:f
  in
  Term.(const tree $ color $ path)
;;

let () =
  Fmt.set_utf_8 Fmt.stdout true;
  Fmt.set_style_renderer Fmt.stdout `Ansi_tty;
  Term.exit @@ Term.eval (cmdliner_term, Term.info "tree")
;;
