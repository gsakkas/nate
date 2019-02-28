
let rec digitsOfInt n = if n > 0 then [digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n = if n < 0 then [] else digitsOfInt (n / 10);;

*)

(* changed spans
(2,27)-(2,32)
n < 0
BopG VarG LitG

(2,38)-(2,60)
[]
ListG EmptyG

*)

(* changed exprs
Bop (Just (2,27)-(2,32)) Lt (Var (Just (2,27)-(2,28)) "n") (Lit (Just (2,31)-(2,32)) (LI 0))
List (Just (2,38)-(2,40)) [] Nothing
*)

(* typed spans
(2,27)-(2,32)
(2,38)-(2,40)
*)

(* correct types
bool
'a list
*)

(* bad types
bool
unit list
*)
