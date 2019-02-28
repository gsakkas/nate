
let rec digitsOfInt n = if n <= 0 then [] else [digitsOfInt (n mod 10)];;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else (digitsOfInt (n mod 10)) @ [];;

*)

(* changed spans
(2,47)-(2,71)
digitsOfInt (n mod 10) @ []
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (2,47)-(2,76)) (Var (Just (2,72)-(2,73)) "@") [App (Just (2,47)-(2,71)) (Var (Just (2,48)-(2,59)) "digitsOfInt") [Bop (Just (2,60)-(2,70)) Mod (Var (Just (2,61)-(2,62)) "n") (Lit (Just (2,67)-(2,69)) (LI 10))],List (Just (2,74)-(2,76)) [] Nothing]
*)

(* typed spans
(2,47)-(2,76)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
