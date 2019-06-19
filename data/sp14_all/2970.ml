
let rec app x y = match x with | [] -> y | h::t -> h :: (app t y);;

let rec digitsOfInt n =
  if n > 10 then app ((digitsOfInt (n / 10)) [n mod 10]) else [n];;


(* fix

let rec digitsOfInt n =
  if n >= 10 then (digitsOfInt (n / 10)) @ [n mod 10] else [n];;

*)

(* changed spans
(5,6)-(5,12)
n >= 10
BopG VarG LitG

(5,18)-(5,57)
digitsOfInt (n / 10) @ [n mod 10]
AppG [AppG [EmptyG],ListG [EmptyG]]

*)

(* type error slice
(2,57)-(2,66)
(2,58)-(2,61)
(4,4)-(5,68)
(4,21)-(5,66)
(5,3)-(5,66)
(5,18)-(5,21)
(5,18)-(5,57)
(5,22)-(5,57)
(5,23)-(5,45)
(5,24)-(5,35)
(5,63)-(5,66)
*)