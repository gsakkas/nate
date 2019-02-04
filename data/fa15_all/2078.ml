
let rec listReverse l = match l with | [] -> [] | h::t -> [listReverse t] @ h;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(2,58)-(2,73)
EMPTY
EmptyG

(2,76)-(2,77)
[h]
ListG VarG Nothing

*)
