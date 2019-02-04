
let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> [digitsOfInt (n / 10)] :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(5,14)-(5,36)
n mod 10
BopG VarG LitG

(5,15)-(5,35)
10
LitG

(5,40)-(5,50)
EMPTY
EmptyG

(5,41)-(5,42)
EMPTY
EmptyG

(5,47)-(5,49)
EMPTY
EmptyG

*)
