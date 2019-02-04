
let rec clone x n = if n = 0 then [] else [x] :: ((clone x n) - 1);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,23)-(2,28)
n <= 0
BopG VarG LitG

(2,42)-(2,45)
EMPTY
EmptyG

(2,49)-(2,66)
EMPTY
EmptyG

(2,59)-(2,60)
n - 1
BopG VarG LitG

*)
