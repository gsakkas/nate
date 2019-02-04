
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) :: h;;


(* fix

let rec listReverse l = match l with | [] -> [] | h::t -> listReverse t;;

*)

(* changed spans
(3,36)-(3,56)
EMPTY
EmptyG

(3,55)-(3,56)
EMPTY
EmptyG

*)
