
let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: [] :: (digitsOfInt (n mod 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10] @ (digitsOfInt (n / 10));;

*)

(* changed spans
(3,25)-(3,35)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

(3,25)-(3,69)
[n mod 10] @ digitsOfInt (n / 10)
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(3,39)-(3,41)
EMPTY
EmptyG

(3,39)-(3,69)
EMPTY
EmptyG

(3,58)-(3,68)
n / 10
BopG VarG LitG

*)
