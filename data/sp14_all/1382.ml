
let rec clone x n = if n <= 0 then x else clone [x] (n - 1);;


(* fix

let rec clone x n = if n <= 0 then [] else clone x (n - 1);;

*)

(* changed spans
(2,35)-(2,36)
[]
ListG EmptyG

(2,48)-(2,51)
x
VarG

*)

(* changed exprs
List (Just (2,35)-(2,37)) [] Nothing
Var (Just (2,49)-(2,50)) "x"
*)

(* typed spans
(2,35)-(2,37)
(2,49)-(2,50)
*)

(* correct types
'a list
'a
*)

(* bad types
'a
'a list
*)
