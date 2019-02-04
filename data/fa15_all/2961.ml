
let rec clone x n = if n = 1 then [x] else List.append [x] ((clone x n) - 1);;


(* fix

let rec clone x n = if n = 1 then [x] else List.append [x] (clone x (n - 1));;

*)

(* changed spans
(2,59)-(2,76)
EMPTY
EmptyG

(2,69)-(2,70)
n - 1
BopG VarG LitG

*)
