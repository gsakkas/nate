
let rec clone x n = let i = 0 in if i < n then x :: ((clone x n) - 1) else [];;


(* fix

let rec clone x n = let i = 0 in if i < n then x :: (clone x (n - 1)) else [];;

*)

(* changed spans
(2,52)-(2,69)
EMPTY
EmptyG

(2,62)-(2,63)
n - 1
BopG VarG LitG

*)
