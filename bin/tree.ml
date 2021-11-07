open Lib
open Cmdliner

let colors =
  let info = Arg.info [ "c"; "C"; "color" ] ~doc:"print with colors" in
  Arg.value (Arg.flag info)
;;

let path =
  let info = Arg.info [ "p"; "P"; "path" ] ~doc:"path to directory" in
  Arg.value (Arg.opt (Arg.some Arg.dir) None info)
;;

let ignore =
  let info = Arg.info [ "i"; "I"; "ignore" ] ~doc:"files to ignore" in
  Arg.value (Arg.opt (Arg.some (Arg.list Arg.string)) None info)
;;

let filter list list' = list |> List.filter (fun i -> not (List.mem i list'))

let cmdliner_term =
  let tree c p i =
    let path =
      match p with
      | None -> Utils.directory
      | Some p -> p
    in
    let files p =
      let files' = p |> Utils.list_root_files |> Array.to_list in
      match i with
      | None -> files'
      | Some l -> filter files' l
    in
    path |> files |> Utils.folder_tree path ~colors:c
  in
  Term.(const tree $ colors $ path $ ignore)
;;

let () =
  Fmt.set_utf_8 Fmt.stdout true;
  Fmt.set_style_renderer Fmt.stdout `Ansi_tty;
  Term.exit @@ Term.eval (cmdliner_term, Term.info "tree")
;;
