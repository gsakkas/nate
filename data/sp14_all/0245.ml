
let rec digitsOfInt n = if n < 0 then true;;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [];;

*)

(* changed spans
(2,24)-(2,42)
[]
ListG EmptyG

*)

(* changed exprs
List (Just (2,38)-(2,40)) [] Nothing
*)

(* typed spans
(2,38)-(2,40)
*)

(* correct types
'a list
*)

(* bad types
unit
*)
