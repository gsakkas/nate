
let rec clone x n =
  if n < 1 then [] else if n = 1 then [x] else x :: ((clone x n) - 1);;


(* fix

let rec clone x n =
  if n < 1 then [] else if n = 1 then [x] else x :: (clone x (n - 1));;

*)

(* changed spans
(3,52)-(3,69)
EMPTY
EmptyG

(3,62)-(3,63)
n - 1
BopG VarG LitG

*)
