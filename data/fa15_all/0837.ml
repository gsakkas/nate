
let rec digitsOfInt n =
  if n <= 0
  then []
  else (match n with | n' -> (n' mod 10) @ (digitsOfInt (n / 10)));;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else (match n with | n' -> (n' mod 10) :: (digitsOfInt (n / 10)));;

*)

(* changed spans
(5,29)-(5,65)
(n' mod 10) :: (digitsOfInt (n / 10))
ConAppG (Just (TupleG (fromList [AppG (fromList [BopG VarG LitG]),BopG VarG LitG])))

*)

(* changed exprs
ConApp (Just (5,29)-(5,66)) "::" (Just (Tuple (Just (5,29)-(5,66)) [Bop (Just (5,29)-(5,40)) Mod (Var (Just (5,30)-(5,32)) "n'") (Lit (Just (5,37)-(5,39)) (LI 10)),App (Just (5,44)-(5,66)) (Var (Just (5,45)-(5,56)) "digitsOfInt") [Bop (Just (5,57)-(5,65)) Div (Var (Just (5,58)-(5,59)) "n") (Lit (Just (5,62)-(5,64)) (LI 10))]])) Nothing
*)

(* typed spans
(5,29)-(5,66)
*)

(* correct types
int list
*)

(* bad types
'a list
*)
