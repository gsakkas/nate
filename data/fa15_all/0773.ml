
let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ ((clone x n) - 1);;


(* fix

let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

*)

(* changed spans
(3,54)-(3,71)
EMPTY
EmptyG

(3,64)-(3,65)
n - 1
BopG VarG LitG

*)
