
let rec clone x n = if n <= 0 then [] else x :: ((clone x n) - 1);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,48)-(2,65)
EMPTY
EmptyG

(2,58)-(2,59)
n - 1
BopG VarG LitG

*)
