
let rec listReverse l =
  match l with | [] -> [] | h::t -> [t] @ (listReverse h);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(3,36)-(3,39)
EMPTY
EmptyG

(3,37)-(3,38)
EMPTY
EmptyG

(3,55)-(3,56)
[h]
ListG VarG Nothing

*)
