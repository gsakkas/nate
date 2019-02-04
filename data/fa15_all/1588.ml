
let rec digitsOfInt n =
  if n < 0 then [] else ((digitsOfInt n) / 10) @ (n mod 10);;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,24)-(3,46)
EMPTY
EmptyG

(3,38)-(3,39)
n / 10
BopG VarG LitG

(3,49)-(3,59)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
