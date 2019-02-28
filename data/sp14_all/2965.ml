
let rec digitsOfInt n = if n > 0 then (digitsOfInt n) / 10 else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [5] @ (digitsOfInt (n / 10)) else [1];;

*)

(* changed spans
(2,38)-(2,58)
[5] @ digitsOfInt (n / 10)
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

(2,64)-(2,66)
[1]
ListG LitG

*)

(* changed exprs
App (Just (2,38)-(2,66)) (Var (Just (2,42)-(2,43)) "@") [List (Just (2,38)-(2,41)) [Lit (Just (2,39)-(2,40)) (LI 5)] Nothing,App (Just (2,44)-(2,66)) (Var (Just (2,45)-(2,56)) "digitsOfInt") [Bop (Just (2,57)-(2,65)) Div (Var (Just (2,58)-(2,59)) "n") (Lit (Just (2,62)-(2,64)) (LI 10))]]
List (Just (2,72)-(2,75)) [Lit (Just (2,73)-(2,74)) (LI 1)] Nothing
*)

(* typed spans
(2,38)-(2,66)
(2,72)-(2,75)
*)

(* correct types
int list
int list
*)

(* bad types
int
'a list
*)
