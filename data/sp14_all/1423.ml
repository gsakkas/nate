
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [0] | _ -> [digitsOfInt (n / 10); n mod 10]);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [0] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(5,39)-(5,71)
digitsOfInt (n / 10) @ [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (5,39)-(5,74)) (Var (Just (5,62)-(5,63)) "@") [App (Just (5,39)-(5,61)) (Var (Just (5,40)-(5,51)) "digitsOfInt") [Bop (Just (5,52)-(5,60)) Div (Var (Just (5,53)-(5,54)) "n") (Lit (Just (5,57)-(5,59)) (LI 10))],List (Just (5,64)-(5,74)) [Bop (Just (5,65)-(5,73)) Mod (Var (Just (5,65)-(5,66)) "n") (Lit (Just (5,71)-(5,73)) (LI 10))] Nothing]
*)

(* typed spans
(5,39)-(5,74)
*)

(* correct types
int list
*)

(* bad types
int list
*)
