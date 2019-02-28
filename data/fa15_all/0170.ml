
let rec digitsOfInt n = if n > 0 then [n mod 10];;


(* fix

let rec digitsOfInt n = if n > 0 then [n mod 10] else [];;

*)

(* changed spans
(2,24)-(2,48)
[]
ListG EmptyG

*)

(* changed exprs
List (Just (2,54)-(2,56)) [] Nothing
*)

(* typed spans
(2,54)-(2,56)
*)

(* correct types
int list
*)

(* bad types
unit
*)
