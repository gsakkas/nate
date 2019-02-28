
let rec digitsOfInt n = if n > 0 then [n; n mod 10];;


(* fix

let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [];;

*)

(* changed spans
(2,38)-(2,51)
(n mod 10) :: (digitsOfInt (n / 10))
ConAppG (Just (TupleG (fromList [AppG (fromList [BopG VarG LitG]),BopG VarG LitG])))

*)

(* changed exprs
ConApp (Just (3,16)-(3,52)) "::" (Just (Tuple (Just (3,16)-(3,52)) [Bop (Just (3,16)-(3,26)) Mod (Var (Just (3,17)-(3,18)) "n") (Lit (Just (3,23)-(3,25)) (LI 10)),App (Just (3,30)-(3,52)) (Var (Just (3,31)-(3,42)) "digitsOfInt") [Bop (Just (3,43)-(3,51)) Div (Var (Just (3,44)-(3,45)) "n") (Lit (Just (3,48)-(3,50)) (LI 10))]])) Nothing
*)

(* typed spans
(3,16)-(3,52)
*)

(* correct types
int list
*)

(* bad types
int list
*)
