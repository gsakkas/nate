
let rec clone x n = if n = 0 then [] else x :: ((clone x n) - 1);;


(* fix

let rec clone x n = if n = 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,47)-(2,64)
EMPTY
EmptyG

(2,57)-(2,58)
n - 1
BopG VarG LitG

*)
