
let rec clone x n = if n > 1 then x :: (clone x (n - 1));;


(* fix

let rec clone x n = x :: (clone x (n - 1));;

*)

(* changed spans
(2,20)-(2,56)
EMPTY
EmptyG

(2,23)-(2,24)
EMPTY
EmptyG

(2,23)-(2,28)
EMPTY
EmptyG

(2,27)-(2,28)
EMPTY
EmptyG

*)
