
let rec clone x n =
  if n <= 0
  then []
  else (match x with | [] -> x | h::t -> (clone t (n - 1)) :: h);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(5,7)-(5,64)
EMPTY
EmptyG

(5,14)-(5,15)
EMPTY
EmptyG

(5,29)-(5,30)
EMPTY
EmptyG

(5,41)-(5,58)
x
VarG

(5,48)-(5,49)
x
VarG

(5,62)-(5,63)
EMPTY
EmptyG

*)
