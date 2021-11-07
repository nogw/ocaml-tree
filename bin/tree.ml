open Lib
open Cmdliner

let color =
  let info = Arg.info [ "c"; "C"; "color" ] ~doc:"print with colors" in
  Arg.value (Arg.flag info)
;;

let cmdliner_term =
  let dir = Utils.directory in
  let tree f =
    dir |> Utils.list_root_files |> Array.to_list |> Utils.folder_tree dir ~colors:f
  in
  Term.(const tree $ color)
;;

let () =
  Fmt.set_utf_8 Fmt.stdout true;
  Fmt.set_style_renderer Fmt.stdout `Ansi_tty;
  Term.exit @@ Term.eval (cmdliner_term, Term.info "tree")
;;
