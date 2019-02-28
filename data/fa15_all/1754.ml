
let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> [(digitsOfInt n) / 10; n mod 10];;


(* fix

let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(5,14)-(5,46)
(n mod 10) :: (digitsOfInt (n / 10))
ConAppG (Just (TupleG (fromList [AppG (fromList [BopG VarG LitG]),BopG VarG LitG])))

*)

(* changed exprs
ConApp (Just (5,14)-(5,50)) "::" (Just (Tuple (Just (5,14)-(5,50)) [Bop (Just (5,14)-(5,24)) Mod (Var (Just (5,15)-(5,16)) "n") (Lit (Just (5,21)-(5,23)) (LI 10)),App (Just (5,28)-(5,50)) (Var (Just (5,29)-(5,40)) "digitsOfInt") [Bop (Just (5,41)-(5,49)) Div (Var (Just (5,42)-(5,43)) "n") (Lit (Just (5,46)-(5,48)) (LI 10))]])) Nothing
*)

(* typed spans
(5,14)-(5,50)
*)

(* correct types
int list
*)

(* bad types
int list
*)
