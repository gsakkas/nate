
let rec digitsOfInt n = if n > 0 then (digitsOfInt (n mod 10)) @ [];;


(* fix

let rec digitsOfInt n = if n > 0 then (digitsOfInt (n mod 10)) @ [] else [];;

*)

(* changed spans
(2,24)-(2,67)
[]
ListG EmptyG

*)

(* changed exprs
List (Just (2,73)-(2,75)) [] Nothing
*)

(* typed spans
(2,73)-(2,75)
*)

(* correct types
'a list
*)

(* bad types
unit
*)
