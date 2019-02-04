
let rec listReverse l =
  match l with | [] -> [] | h -> [h] | h::t -> t @ (listReverse [h]);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h -> h | h::t -> t @ (listReverse [h]);;

*)

(* changed spans
(3,33)-(3,36)
EMPTY
EmptyG

*)
