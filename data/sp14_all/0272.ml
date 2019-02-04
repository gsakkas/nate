
let rec digitsOfInt n = if n <= 0 then [] else [digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else [n mod 10];;

*)

(* changed spans
(2,48)-(2,59)
EMPTY
EmptyG

(2,48)-(2,68)
EMPTY
EmptyG

(2,60)-(2,68)
n mod 10
BopG VarG LitG

*)
