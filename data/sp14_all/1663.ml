
let rec digitsOfInt n = if n < 0 then [] else (match n with | f::b -> f);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else (n mod 10) :: (digitsOfInt n);;

*)

(* changed spans
(2,46)-(2,72)
(n mod 10) :: (digitsOfInt n)
ConAppG (Just (TupleG (fromList [AppG (fromList [VarG]),BopG VarG LitG])))

*)

(* changed exprs
ConApp (Just (2,46)-(2,75)) "::" (Just (Tuple (Just (2,46)-(2,75)) [Bop (Just (2,46)-(2,56)) Mod (Var (Just (2,47)-(2,48)) "n") (Lit (Just (2,53)-(2,55)) (LI 10)),App (Just (2,60)-(2,75)) (Var (Just (2,61)-(2,72)) "digitsOfInt") [Var (Just (2,73)-(2,74)) "n"]])) Nothing
*)

(* typed spans
(2,46)-(2,75)
*)

(* correct types
int list
*)

(* bad types
'a list
*)
