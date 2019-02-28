
let rec digitsOfInt n =
  let myList = [] in if n <= 0 then ([] mod 10) :: myList;;


(* fix

let rec digitsOfInt n = let myList = [] in if n <= 0 then [] else [];;

*)

(* changed spans
(3,36)-(3,57)
[]
ListG EmptyG

(3,21)-(3,57)
[]
ListG EmptyG

*)

(* changed exprs
List (Just (2,58)-(2,60)) [] Nothing
List (Just (2,66)-(2,68)) [] Nothing
*)

(* typed spans
(2,58)-(2,60)
(2,66)-(2,68)
*)

(* correct types
'a list
'a list
*)

(* bad types
int list
unit
*)
