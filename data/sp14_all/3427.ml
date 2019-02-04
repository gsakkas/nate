
let rec listReverse l =
  match l with | [] -> [] | x::l -> (listReverse l) :: x;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | x::l -> x :: (listReverse l);;

*)

(* changed spans
(3,36)-(3,51)
x
VarG

(3,55)-(3,56)
EMPTY
EmptyG

*)
