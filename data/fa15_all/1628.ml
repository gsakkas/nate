
let rec digitsOfInt n =
  if n < 0 then [] else [digitsOfInt (n / 10)] @ [n mod 10];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,5)-(3,10)
n <= 0
BopG VarG LitG

(3,24)-(3,46)
EMPTY
EmptyG

*)
