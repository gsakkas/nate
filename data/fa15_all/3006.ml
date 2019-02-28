
let rec clone x n = if n = 0 then x else (let c = x :: x in clone x (n - 1));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,23)-(2,28)
n <= 0
BopG VarG LitG

(2,34)-(2,35)
[]
ListG EmptyG

(2,55)-(2,56)
EMPTY
EmptyG

*)

(* typed spans
(2,23)-(2,29)
(2,35)-(2,37)
*)

(* typed spans
bool
'a list
*)

(* typed spans
bool
'a
*)
