
let rec clone x n = if n > 0 then clone [x] (n - 1) else [];;


(* fix

let rec clone x n = if n > 0 then clone x (n - 1) else [];;

*)

(* changed spans
(2,40)-(2,43)
EMPTY
EmptyG

*)
