
let rec listReverse l =
  match l with | [] -> [] | _::tl -> (listReverse tl) + tl;;


(* fix

let rec listReverse l = match l with | [] -> [] | _::tl -> listReverse tl;;

*)

(* changed spans
(3,37)-(3,58)
EMPTY
EmptyG

(3,56)-(3,58)
EMPTY
EmptyG

*)
