
let rec digitsOfInt n =
  if n < 0
  then []
  else if (n mod 10) = 0 then n else (n mod 10) :: (digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,5)-(3,10)
n <= 0
BopG VarG LitG

(5,7)-(5,73)
EMPTY
EmptyG

(5,10)-(5,20)
EMPTY
EmptyG

(5,10)-(5,24)
EMPTY
EmptyG

(5,11)-(5,12)
EMPTY
EmptyG

(5,17)-(5,19)
EMPTY
EmptyG

(5,23)-(5,24)
EMPTY
EmptyG

(5,30)-(5,31)
EMPTY
EmptyG

*)
