
let rec digitsOfInt n = if n < 0 then [] else (digitsOfInt n) mod 10;;


(* fix

let rec digitsOfInt n = if n < 0 then [] else digitsOfInt (n / 10);;

*)

(* changed spans
(2,46)-(2,68)
EMPTY
EmptyG

(2,59)-(2,60)
n / 10
BopG VarG LitG

*)
