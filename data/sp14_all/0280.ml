
let rec digitsOfInt n =
  if n <= 0 then [] else if n > 9 then (n mod 10) :: (digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,25)-(3,75)
EMPTY
EmptyG

(3,28)-(3,29)
EMPTY
EmptyG

(3,28)-(3,33)
EMPTY
EmptyG

(3,32)-(3,33)
EMPTY
EmptyG

*)
