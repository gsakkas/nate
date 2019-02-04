
let rec clone x n = if x <= 0 then [] else clone [x] (n - 1);;


(* fix

let rec clone x n = if n <= 0 then [] else clone x (n - 1);;

*)

(* changed spans
(2,23)-(2,24)
n
VarG

(2,49)-(2,52)
EMPTY
EmptyG

*)
