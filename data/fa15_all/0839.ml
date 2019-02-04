
let rec digitsOfInt n =
  if n <= 0
  then []
  else (match n with | n' -> (digitsOfInt (n / 10)) :: (n' mod 10));;


(* fix

let modulus ss = ss mod 10;;

let rec digitsOfInt n =
  if n <= 0
  then []
  else (match n with | n' -> (digitsOfInt (n / 10)) @ [modulus n']);;

*)

(* changed spans
(2,20)-(5,67)
fun ss -> ss mod 10
LamG (BopG EmptyG EmptyG)

(5,29)-(5,51)
(@)
VarG

(5,29)-(5,66)
digitsOfInt (n / 10) @ [modulus n']
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(5,55)-(5,66)
[modulus n']
ListG (AppG (fromList [EmptyG])) Nothing

(5,56)-(5,58)
modulus n'
AppG (fromList [VarG])

(5,63)-(5,65)
EMPTY
EmptyG

*)
