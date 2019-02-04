
let rec clone x n = let accum = [] in if n < 1 then [] else (clone x n) - 1;;


(* fix

let rec clone x n = let accum = [] in if n < 1 then [] else clone x (n - 1);;

*)

(* changed spans
(2,60)-(2,75)
EMPTY
EmptyG

(2,69)-(2,70)
n - 1
BopG VarG LitG

*)
