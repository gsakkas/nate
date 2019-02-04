
let rec listReverse l =
  match l with | [] -> [] | h::t -> [listReverse t] @ [h];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(3,36)-(3,51)
EMPTY
EmptyG

*)
