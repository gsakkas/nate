
let rec digitsOfInt n =
  if n < 0 then [] else if n < 10 then [n] else (digitsOfInt n) / 10;;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else if n < 10 then [n] else digitsOfInt (n / 10);;

*)

(* changed spans
(3,48)-(3,68)
EMPTY
EmptyG

(3,61)-(3,62)
n / 10
BopG VarG LitG

*)
