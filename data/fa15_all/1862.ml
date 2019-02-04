
let rec digitsOfInt n = if n < 0 then [] else (digitsOfInt n) / 1;;


(* fix

let rec digitsOfInt n = if n < 0 then [] else digitsOfInt (n / 10);;

*)

(* changed spans
(2,46)-(2,65)
EMPTY
EmptyG

(2,59)-(2,60)
n / 10
BopG VarG LitG

(2,64)-(2,65)
10
LitG

*)
