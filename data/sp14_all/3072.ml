
let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l = match l with | [] -> [] | h::t -> (cat t h) :: l;;


(* fix

let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> listReverse (cat l h);;

*)

(* changed spans
(4,58)-(4,67)
listReverse
VarG

(4,58)-(4,72)
listReverse (cat l h)
AppG (fromList [AppG (fromList [EmptyG])])

(4,63)-(4,64)
EMPTY
EmptyG

(4,65)-(4,66)
EMPTY
EmptyG

*)
