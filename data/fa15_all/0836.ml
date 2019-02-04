
let rec digitsOfInt n =
  if n <= 0
  then []
  else (match n with | n_ -> (digitsOfInt (n / 10)) :: (n_ mod 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else (match n with | n_ -> (n_ mod 10) :: (digitsOfInt (n / 10)));;

*)

(* changed spans
(5,29)-(5,51)
n_ mod 10
BopG VarG LitG

(5,55)-(5,66)
EMPTY
EmptyG

(5,56)-(5,58)
EMPTY
EmptyG

(5,63)-(5,65)
EMPTY
EmptyG

*)
