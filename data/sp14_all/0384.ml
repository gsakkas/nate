
let rec digitsOfInt n = [(digitsOfInt n) / 10] @ [n mod 10];;


(* fix

let rec digitsOfInt n = (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(2,24)-(2,59)
(n mod 10) :: (digitsOfInt (n / 10))
ConAppG (Just (TupleG (fromList [AppG (fromList [BopG VarG LitG]),BopG VarG LitG])))

*)

(* changed exprs
ConApp (Just (2,24)-(2,60)) "::" (Just (Tuple (Just (2,24)-(2,60)) [Bop (Just (2,24)-(2,34)) Mod (Var (Just (2,25)-(2,26)) "n") (Lit (Just (2,31)-(2,33)) (LI 10)),App (Just (2,38)-(2,60)) (Var (Just (2,39)-(2,50)) "digitsOfInt") [Bop (Just (2,51)-(2,59)) Div (Var (Just (2,52)-(2,53)) "n") (Lit (Just (2,56)-(2,58)) (LI 10))]])) Nothing
*)

(* typed spans
(2,24)-(2,60)
*)

(* correct types
int list
*)

(* bad types
int list
*)
