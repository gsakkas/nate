
let rec clone x n =
  match n <= 0 with | true  -> [] | false  -> x :: ((clone x n) - 1);;


(* fix

let rec clone x n =
  match n <= 0 with | true  -> [] | false  -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,51)-(3,68)
EMPTY
EmptyG

(3,61)-(3,62)
n - 1
BopG VarG LitG

*)
