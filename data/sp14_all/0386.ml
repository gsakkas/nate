
let rec digitsOfInt n = (n mod 10) :: ((digitsOfInt n) / 10);;


(* fix

let rec digitsOfInt n = (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(2,38)-(2,60)
EMPTY
EmptyG

(2,52)-(2,53)
n / 10
BopG VarG LitG

*)
