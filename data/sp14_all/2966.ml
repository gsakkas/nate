
let rec digitsOfInt n = if n > 0 then [5] @ ((digitsOfInt n) / 10) else [1];;


(* fix

let rec digitsOfInt n = if n > 0 then [5] @ (digitsOfInt (n / 10)) else [1];;

*)

(* changed spans
(2,44)-(2,66)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (2,44)-(2,66)) (Var (Just (2,45)-(2,56)) "digitsOfInt") [Bop (Just (2,57)-(2,65)) Div (Var (Just (2,58)-(2,59)) "n") (Lit (Just (2,62)-(2,64)) (LI 10))]
*)

(* typed spans
(2,44)-(2,66)
*)

(* correct types
int list
*)

(* bad types
int
*)
