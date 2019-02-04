
let join x l = x :: l;;

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> join (listReverse tl) hd;;


(* fix

let join x l = l :: x;;

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> join (listReverse tl) hd;;

*)

(* changed spans
(2,15)-(2,16)
EMPTY
EmptyG

(4,20)-(5,62)
x
VarG

*)
