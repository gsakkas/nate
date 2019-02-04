
let rec clone x n = if n > 0 then x :: ((clone x n) - 1) else [];;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

*)

(* changed spans
(2,39)-(2,56)
EMPTY
EmptyG

(2,49)-(2,50)
n - 1
BopG VarG LitG

*)
