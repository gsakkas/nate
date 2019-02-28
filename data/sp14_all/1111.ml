
let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> [(digitsOfInt n) / 10; n mod 10];;


(* fix

let rec digitsOfInt n =
  match n <= 0 with | true  -> [] | false  -> (n mod 10) :: (digitsOfInt n);;

*)

(* changed spans
(5,14)-(5,46)
(n mod 10) :: (digitsOfInt n)
ConAppG (Just (TupleG (fromList [AppG (fromList [VarG]),BopG VarG LitG])))

*)

(* changed exprs
ConApp (Just (3,46)-(3,75)) "::" (Just (Tuple (Just (3,46)-(3,75)) [Bop (Just (3,46)-(3,56)) Mod (Var (Just (3,47)-(3,48)) "n") (Lit (Just (3,53)-(3,55)) (LI 10)),App (Just (3,60)-(3,75)) (Var (Just (3,61)-(3,72)) "digitsOfInt") [Var (Just (3,73)-(3,74)) "n"]])) Nothing
*)

(* typed spans
(3,46)-(3,75)
*)

(* correct types
int list
*)

(* bad types
int list
*)
