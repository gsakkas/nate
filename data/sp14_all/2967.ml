
let rec digitsOfInt n = if n > 10 then (n mod 10) :: (digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  if n > 10 then (n mod 10) :: (digitsOfInt (n / 10)) else [n];;

*)

(* changed spans
(2,24)-(2,75)
[n]
ListG VarG

*)

(* changed exprs
List (Just (3,59)-(3,62)) [Var (Just (3,60)-(3,61)) "n"] Nothing
*)

(* typed spans
(3,59)-(3,62)
*)

(* correct types
int list
*)

(* bad types
unit
*)
