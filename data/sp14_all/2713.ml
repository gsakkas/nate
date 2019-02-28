
let rec digitsOfInt n =
  if n > 0 then [digitsOfInt (n / 10); n mod 10] else [];;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

*)

(* changed spans
(3,16)-(3,48)
digitsOfInt (n / 10) @ [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (3,16)-(3,51)) (Var (Just (3,39)-(3,40)) "@") [App (Just (3,16)-(3,38)) (Var (Just (3,17)-(3,28)) "digitsOfInt") [Bop (Just (3,29)-(3,37)) Div (Var (Just (3,30)-(3,31)) "n") (Lit (Just (3,34)-(3,36)) (LI 10))],List (Just (3,41)-(3,51)) [Bop (Just (3,42)-(3,50)) Mod (Var (Just (3,42)-(3,43)) "n") (Lit (Just (3,48)-(3,50)) (LI 10))] Nothing]
*)

(* typed spans
(3,16)-(3,51)
*)

(* correct types
int list
*)

(* bad types
int list
*)
