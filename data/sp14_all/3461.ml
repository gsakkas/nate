
let rec digitsOfInt n = let myList = [] in if n <= 0 then [];;


(* fix

let rec digitsOfInt n = let myList = [] in if n <= 0 then [] else [];;

*)

(* changed spans
(2,43)-(2,60)
[]
ListG EmptyG

*)

(* changed exprs
List (Just (2,66)-(2,68)) [] Nothing
*)

(* typed spans
(2,66)-(2,68)
*)

(* correct types
'a list
*)

(* bad types
unit
*)
