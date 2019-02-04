
let rec digitsOfInt n =
  if n > 0 then let k = digitsOfInt (n / 10) in k :: (n mod 10) else [];;


(* fix

let rec digitsOfInt n =
  if n > 0 then let k = digitsOfInt (n / 10) in (n mod 10) :: k else [];;

*)

(* changed spans
(3,48)-(3,49)
EMPTY
EmptyG

(3,69)-(3,71)
k
VarG

*)
