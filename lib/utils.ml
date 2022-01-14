let green = Fmt.(styled `Green (styled `Bold string))
let white_bold = Fmt.(styled `White (styled `Bold string))
let directory = Sys.getcwd ()
let list_root_files dir = Sys.readdir dir
let filter list list' = list |> List.filter (fun i -> not (List.mem i list'))

let pretty_ff i s f t c =
  match t with
  | `Folder -> if c then Fmt.pr "%s%s %a\n" i s white_bold f else Fmt.pr "%s%s %s\n" i s f
  | `File -> if c then Fmt.pr "%s%s %a\n" i s green f else Fmt.pr "%s%s %s\n" i s f
;;

let print_list l = l |> String.concat ", " |> Printf.printf "[ %s ]\n"

let rec folder_tree path ?(ident = "") ?(colors = false) ?(ignore = []) dir =
  let show file =
    let is_last = List.nth dir (pred (List.length dir)) = file in
    let symbol = if is_last then "└──" else "├──"
    and ident' = if is_last then "    " else "│   "
    and path' = path ^ "/" ^ file in
    if Sys.is_directory path'
    then (
      pretty_ff ident symbol file `Folder colors;
      folder_tree
        path'
        ~ident:(ident ^ ident')
        ~colors
        ~ignore
        (list_root_files path' |> Array.to_list |> fun d -> filter d ignore))
    else pretty_ff ident symbol file `File colors
  in
  match dir with
  | [] -> ()
  | [ head ] -> show head
  | head :: tail ->
    show head;
    folder_tree path ~ident ~colors ~ignore tail
;;
