
let rec clone x n = if n <= 0 then [] else [x] :: ((clone x n) - 1);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,43)-(2,46)
EMPTY
EmptyG

(2,50)-(2,67)
EMPTY
EmptyG

(2,60)-(2,61)
n - 1
BopG VarG LitG

*)
