
let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: ((digitsOfInt n) / 10) else [];;


(* fix

let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [];;

*)

(* changed spans
(3,30)-(3,52)
EMPTY
EmptyG

(3,44)-(3,45)
n / 10
BopG VarG LitG

*)
