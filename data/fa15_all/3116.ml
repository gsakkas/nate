
let rec digitsOfInt n =
  if n > 0 then [digitsOfInt ((n - (n mod 10)) / 10); n mod 10] else [];;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt ((n - (n mod 10)) / 10)) @ [n mod 10] else [];;

*)

(* changed spans
(3,16)-(3,63)
digitsOfInt ((n - (n mod 10)) / 10) @ [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (3,16)-(3,66)) (Var (Just (3,54)-(3,55)) "@") [App (Just (3,16)-(3,53)) (Var (Just (3,17)-(3,28)) "digitsOfInt") [Bop (Just (3,29)-(3,52)) Div (Bop (Just (3,30)-(3,46)) Minus (Var (Just (3,31)-(3,32)) "n") (Bop (Just (3,35)-(3,45)) Mod (Var (Just (3,36)-(3,37)) "n") (Lit (Just (3,42)-(3,44)) (LI 10)))) (Lit (Just (3,49)-(3,51)) (LI 10))],List (Just (3,56)-(3,66)) [Bop (Just (3,57)-(3,65)) Mod (Var (Just (3,57)-(3,58)) "n") (Lit (Just (3,63)-(3,65)) (LI 10))] Nothing]
*)

(* typed spans
(3,16)-(3,66)
*)

(* correct types
int list
*)

(* bad types
int list
*)
