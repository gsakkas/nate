
let rec digitsOfInt n =
  if n <= 0 then [] else [digitsOfInt (n / 10); n mod 10];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10] @ (digitsOfInt (n / 10));;

*)

(* changed spans
(3,25)-(3,57)
[n mod 10] @ digitsOfInt (n / 10)
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(3,26)-(3,46)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

(3,48)-(3,49)
EMPTY
EmptyG

(3,48)-(3,56)
EMPTY
EmptyG

(3,54)-(3,56)
EMPTY
EmptyG

*)
