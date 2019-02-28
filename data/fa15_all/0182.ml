
let rec digitsOfInt n = if n > 0 then (digitsOfInt (n / 10)) @ [];;


(* fix

let rec digitsOfInt n = if n > 0 then (digitsOfInt (n / 10)) @ [] else [];;

*)

(* changed spans
(2,24)-(2,65)
[]
ListG EmptyG

*)

(* changed exprs
List (Just (2,71)-(2,73)) [] Nothing
*)

(* typed spans
(2,71)-(2,73)
*)

(* correct types
'a list
*)

(* bad types
unit
*)
