
let rec digitsOfInt n = if n < 0 then [];;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [];;

*)

(* changed spans
(2,24)-(2,40)
[]
ListG EmptyG

*)

(* changed exprs
List (Just (2,46)-(2,48)) [] Nothing
*)

(* typed spans
(2,46)-(2,48)
*)

(* correct types
'a list
*)

(* bad types
unit
*)
