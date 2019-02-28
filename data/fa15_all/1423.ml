
let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) @ (digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,25)-(3,60)
(n mod 10) :: (digitsOfInt (n / 10))
ConAppG (Just (TupleG (fromList [AppG (fromList [BopG VarG LitG]),BopG VarG LitG])))

*)

(* changed exprs
ConApp (Just (3,25)-(3,61)) "::" (Just (Tuple (Just (3,25)-(3,61)) [Bop (Just (3,25)-(3,35)) Mod (Var (Just (3,26)-(3,27)) "n") (Lit (Just (3,32)-(3,34)) (LI 10)),App (Just (3,39)-(3,61)) (Var (Just (3,40)-(3,51)) "digitsOfInt") [Bop (Just (3,52)-(3,60)) Div (Var (Just (3,53)-(3,54)) "n") (Lit (Just (3,57)-(3,59)) (LI 10))]])) Nothing
*)

(* typed spans
(3,25)-(3,61)
*)

(* correct types
int list
*)

(* bad types
'a list
*)
