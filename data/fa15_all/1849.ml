
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ (n mod 10);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,25)-(3,47)
n mod 10
BopG VarG LitG

(3,25)-(3,60)
EMPTY
EmptyG

(3,48)-(3,49)
(n mod 10) :: (digitsOfInt (n / 10))
ConAppG (Just (TupleG (fromList [AppG (fromList [BopG VarG LitG]),BopG VarG LitG]))) Nothing

(3,50)-(3,60)
EMPTY
EmptyG

(3,51)-(3,52)
EMPTY
EmptyG

(3,57)-(3,59)
EMPTY
EmptyG

*)
