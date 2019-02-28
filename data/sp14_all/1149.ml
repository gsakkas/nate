
let rec digitsOfInt n =
  if n < 0
  then []
  else if n < 10 then n else [digitsOfInt (n / 10); n mod 10];;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else if n < 10 then [n] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(5,22)-(5,23)
[n]
ListG VarG

(5,29)-(5,61)
(n mod 10) :: (digitsOfInt (n / 10))
ConAppG (Just (TupleG (fromList [AppG (fromList [BopG VarG LitG]),BopG VarG LitG])))

*)

(* changed exprs
List (Just (5,22)-(5,25)) [Var (Just (5,23)-(5,24)) "n"] Nothing
ConApp (Just (5,31)-(5,67)) "::" (Just (Tuple (Just (5,31)-(5,67)) [Bop (Just (5,31)-(5,41)) Mod (Var (Just (5,32)-(5,33)) "n") (Lit (Just (5,38)-(5,40)) (LI 10)),App (Just (5,45)-(5,67)) (Var (Just (5,46)-(5,57)) "digitsOfInt") [Bop (Just (5,58)-(5,66)) Div (Var (Just (5,59)-(5,60)) "n") (Lit (Just (5,63)-(5,65)) (LI 10))]])) Nothing
*)

(* typed spans
(5,22)-(5,25)
(5,31)-(5,67)
*)

(* correct types
int list
int list
*)

(* bad types
int
int list
*)
