
let rec listReverse l = match l with | h::t -> [h] @ (listReverse [t]);;


(* fix

let rec listReverse l = match l with | h::t -> [h] @ (listReverse t);;

*)

(* changed spans
(2,66)-(2,69)
EMPTY
EmptyG

*)
