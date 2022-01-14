let green = Fmt.(styled `Green (styled `Bold string))
let white_bold = Fmt.(styled `White (styled `Bold string))
let directory = Sys.getcwd ()
let list_root_files dir = Sys.readdir dir

let print_file_or_folder i s f t c =
  match t with
  | `Folder ->
    if c then Fmt.pr "%s%s %a\n" i s white_bold f else Fmt.pr "%s%s %s\n" i s f
  | `File -> if c then Fmt.pr "%s%s %a\n" i s green f else Fmt.pr "%s%s %s\n" i s f
;;

let rec folder_tree path ?(ident = "") ?(colors = false) ?(ignore = []) dir =
  let is_dir file =
    let is_last = List.nth dir (pred(List.length dir)) = file in
    let symbol = if is_last then "└──" else "├──"
    and ident' = if is_last then "    " else "│   "

    and path' = path ^ "/" ^ file in
    
    match Sys.is_directory path' with
    | true ->
      print_file_or_folder ident symbol file `Folder colors;
      folder_tree
        path'
        ~ident:(ident ^ ident')
        (list_root_files path' |> Array.to_list)
        ~colors
        ~ignore
    | false -> print_file_or_folder ident symbol file `File colors
  in
  match dir with
  | [] -> ()
  | [ head ] -> is_dir head
  | head :: tail ->
    is_dir head;
    folder_tree path ~ident ~colors ~ignore tail
;;