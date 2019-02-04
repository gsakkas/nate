
let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> [[digitsOfInt (n / 10)]; n mod 10];;


(* fix

let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(5,14)-(5,48)
EMPTY
EmptyG

(5,15)-(5,37)
(n mod 10) :: (digitsOfInt (n / 10))
ConAppG (Just (TupleG (fromList [AppG (fromList [BopG VarG LitG]),BopG VarG LitG]))) Nothing

(5,16)-(5,36)
n mod 10
BopG VarG LitG

(5,39)-(5,40)
EMPTY
EmptyG

(5,39)-(5,47)
EMPTY
EmptyG

(5,45)-(5,47)
EMPTY
EmptyG

*)
