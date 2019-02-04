
let rec digitsOfInt n =
  if n != 0
  then
    (if n > 0
     then (digitsOfInt (n / 10)) @ [n mod 10]
     else (digitsOfInt n) * (-1))
  else [];;


(* fix

let rec digitsOfInt n =
  if n != 0
  then
    (if n > 0
     then (digitsOfInt (n / 10)) @ [n mod 10]
     else digitsOfInt (n * (-1)))
  else [];;

*)

(* changed spans
(7,10)-(7,32)
EMPTY
EmptyG

(7,23)-(7,24)
n * (-1)
BopG VarG LitG

*)
