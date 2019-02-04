
let rec clone x n = match n with | 0 -> [] | _ -> x :: ((clone x n) - 1);;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone x (n - 1));;

*)

(* changed spans
(2,55)-(2,72)
EMPTY
EmptyG

(2,65)-(2,66)
n - 1
BopG VarG LitG

*)
