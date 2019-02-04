
let rec digitsOfInt n = if n > 0 then [5] @ ((digitsOfInt n) / 10) else [1];;


(* fix

let rec digitsOfInt n = if n > 0 then [5] @ (digitsOfInt (n / 10)) else [1];;

*)

(* changed spans
(2,44)-(2,66)
EMPTY
EmptyG

(2,58)-(2,59)
n / 10
BopG VarG LitG

*)
