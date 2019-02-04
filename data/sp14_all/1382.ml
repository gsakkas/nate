
let rec clone x n = if n <= 0 then x else clone [x] (n - 1);;


(* fix

let rec clone x n = if n <= 0 then [] else clone x (n - 1);;

*)

(* changed spans
(2,35)-(2,36)
[]
ListG EmptyG Nothing

(2,48)-(2,51)
EMPTY
EmptyG

*)
