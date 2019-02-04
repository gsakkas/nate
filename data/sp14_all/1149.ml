
let rec digitsOfInt n =
  if n < 0
  then []
  else if n < 10 then n else [digitsOfInt (n / 10); n mod 10];;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else if n < 10 then [n] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(5,22)-(5,23)
[n]
ListG VarG Nothing

(5,29)-(5,61)
(n mod 10) :: (digitsOfInt (n / 10))
ConAppG (Just (TupleG (fromList [AppG (fromList [BopG VarG LitG]),BopG VarG LitG]))) Nothing

(5,30)-(5,50)
n mod 10
BopG VarG LitG

(5,52)-(5,53)
EMPTY
EmptyG

(5,52)-(5,60)
EMPTY
EmptyG

(5,58)-(5,60)
EMPTY
EmptyG

*)
