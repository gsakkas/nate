
let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: ((clone x n) - 1);;


(* fix

let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,50)-(3,67)
EMPTY
EmptyG

(3,60)-(3,61)
n - 1
BopG VarG LitG

*)
