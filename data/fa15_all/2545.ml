
let rec clone x n = if n <= 0 then [] else (clone x n) - 1;;


(* fix

let rec clone x n = if n <= 0 then [] else clone x (n - 1);;

*)

(* changed spans
(2,43)-(2,58)
EMPTY
EmptyG

(2,52)-(2,53)
n - 1
BopG VarG LitG

*)
