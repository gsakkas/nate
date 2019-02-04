
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) :: (n mod 10) else 0;;


(* fix

let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [];;

*)

(* changed spans
(3,16)-(3,38)
n mod 10
BopG VarG LitG

(3,42)-(3,52)
EMPTY
EmptyG

(3,43)-(3,44)
EMPTY
EmptyG

(3,49)-(3,51)
EMPTY
EmptyG

(3,58)-(3,59)
[]
ListG EmptyG Nothing

*)
