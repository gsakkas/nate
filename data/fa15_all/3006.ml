
let rec clone x n = if n = 0 then x else (let c = x :: x in clone x (n - 1));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,23)-(2,28)
n <= 0
BopG VarG LitG

(2,34)-(2,35)
EMPTY
EmptyG

(2,41)-(2,76)
[]
ListG EmptyG Nothing

(2,55)-(2,56)
EMPTY
EmptyG

*)
