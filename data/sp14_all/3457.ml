
let rec digitsOfInt n = if n <= 0 then [] else n mod 10;;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else [n];;

*)

(* changed spans
(2,47)-(2,55)
[n]
ListG VarG

*)

(* changed exprs
List (Just (2,47)-(2,50)) [Var (Just (2,48)-(2,49)) "n"] Nothing
*)

(* typed spans
(2,47)-(2,50)
*)

(* correct types
int list
*)

(* bad types
int
*)
