
let rec digitsOfInt n =
  if n < 0
  then []
  else if n = 0 then [] else [digitsOfInt (n / 10); n mod 10];;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else if n = 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(5,29)-(5,61)
digitsOfInt (n / 10) @ [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (5,29)-(5,64)) (Var (Just (5,52)-(5,53)) "@") [App (Just (5,29)-(5,51)) (Var (Just (5,30)-(5,41)) "digitsOfInt") [Bop (Just (5,42)-(5,50)) Div (Var (Just (5,43)-(5,44)) "n") (Lit (Just (5,47)-(5,49)) (LI 10))],List (Just (5,54)-(5,64)) [Bop (Just (5,55)-(5,63)) Mod (Var (Just (5,55)-(5,56)) "n") (Lit (Just (5,61)-(5,63)) (LI 10))] Nothing]
*)

(* typed spans
(5,29)-(5,64)
*)

(* correct types
int list
*)

(* bad types
int list
*)
