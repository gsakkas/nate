
let rec digitsOfInt n =
  let myList = [] in if n <= 0 then ([] mod 10) :: myList;;


(* fix

let rec digitsOfInt n =
  let myList = [] in if n <= 0 then [] else (n mod 10) :: myList;;

*)

(* changed spans
(3,36)-(3,57)
[]
ListG EmptyG

(3,37)-(3,39)
n
VarG

*)

(* changed exprs
List (Just (3,36)-(3,38)) [] Nothing
Var (Just (3,45)-(3,46)) "n"
*)

(* typed spans
(3,36)-(3,38)
(3,45)-(3,46)
*)

(* correct types
int list
int
*)

(* bad types
int list
'a list
*)
