
let stringOfList f l =
  let fx a b = match b with | [] -> [] | h::t -> List.append a (f b) in
  let base = "" in List.fold_left fx base l;;


(* fix

let stringOfList f l =
  let fx a b = a ^ b in let base = "" in List.fold_left fx base l;;

*)

(* changed spans
(3,15)-(3,68)
EMPTY
EmptyG

(3,49)-(3,60)
(^)
VarG

(3,63)-(3,68)
EMPTY
EmptyG

*)

(* typed spans
(3,17)-(3,18)
*)

(* typed spans
string -> string -> string
*)

(* typed spans
'a list -> 'a list -> 'a list
*)
