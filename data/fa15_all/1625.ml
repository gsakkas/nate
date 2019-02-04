
let rec digitsOfInt n =
  if n < 0 then [] else (n mod 10) @ [digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,5)-(3,10)
n <= 0
BopG VarG LitG

(3,24)-(3,34)
EMPTY
EmptyG

(3,25)-(3,26)
EMPTY
EmptyG

(3,31)-(3,33)
EMPTY
EmptyG

(3,37)-(3,59)
EMPTY
EmptyG

*)
