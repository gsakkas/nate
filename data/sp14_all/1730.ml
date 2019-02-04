
let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10] @ ((digitsOfInt n) / 10);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10] @ (digitsOfInt (n / 10));;

*)

(* changed spans
(3,38)-(3,60)
EMPTY
EmptyG

(3,52)-(3,53)
n / 10
BopG VarG LitG

*)
