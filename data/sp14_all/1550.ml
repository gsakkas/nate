
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,25)-(3,47)
n mod 10
BopG VarG LitG

(3,51)-(3,61)
EMPTY
EmptyG

(3,52)-(3,53)
EMPTY
EmptyG

(3,58)-(3,60)
EMPTY
EmptyG

*)
