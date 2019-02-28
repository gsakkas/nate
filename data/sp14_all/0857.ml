
let rec digitsOfInt n =
  let ns = [] in
  match n with
  | 0 -> ns
  | n -> if n < 0 then [] else [(n mod 10) :: (digitsOfInt (n / 10))];;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with
  | 0 -> ns
  | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(6,31)-(6,69)
(n mod 10) :: (digitsOfInt (n / 10))
ConAppG (Just (TupleG (fromList [AppG (fromList [BopG VarG LitG]),BopG VarG LitG])))

*)

(* changed exprs
ConApp (Just (6,31)-(6,67)) "::" (Just (Tuple (Just (6,31)-(6,67)) [Bop (Just (6,31)-(6,41)) Mod (Var (Just (6,32)-(6,33)) "n") (Lit (Just (6,38)-(6,40)) (LI 10)),App (Just (6,45)-(6,67)) (Var (Just (6,46)-(6,57)) "digitsOfInt") [Bop (Just (6,58)-(6,66)) Div (Var (Just (6,59)-(6,60)) "n") (Lit (Just (6,63)-(6,65)) (LI 10))]])) Nothing
*)

(* typed spans
(6,31)-(6,67)
*)

(* correct types
int list
*)

(* bad types
int list list
*)
