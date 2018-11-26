
let rec app x y = match x with | [] -> y | h::t -> h :: (app t y);;

let rec digitsOfInt n =
  if n >= 10 then app (digitsOfInt (n / 10) [n mod 10]) else [n];;


(* fix

let rec digitsOfInt n =
  if n >= 10 then (digitsOfInt (n / 10)) @ [n mod 10] else [n];;

*)

(* changed spans
(5,23)-(5,34)
(@)
VarG

(5,23)-(5,34)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)
