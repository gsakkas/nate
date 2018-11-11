
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [0] | _ -> [digitsOfInt (n / 10); n mod 10]);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [0] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(5,39)-(5,71)
digitsOfInt (n / 10) @ [n mod 10]
AppG [AppG [EmptyG],ListG EmptyG Nothing]

(5,40)-(5,60)
(@)
VarG

(5,62)-(5,70)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)