
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,25)-(3,61)
digitsOfInt (n / 10) @ [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (3,25)-(3,60)) (Var (Just (3,48)-(3,49)) "@") [App (Just (3,25)-(3,47)) (Var (Just (3,26)-(3,37)) "digitsOfInt") [Bop (Just (3,38)-(3,46)) Div (Var (Just (3,39)-(3,40)) "n") (Lit (Just (3,43)-(3,45)) (LI 10))],List (Just (3,50)-(3,60)) [Bop (Just (3,51)-(3,59)) Mod (Var (Just (3,51)-(3,52)) "n") (Lit (Just (3,57)-(3,59)) (LI 10))] Nothing]
*)

(* typed spans
(3,25)-(3,60)
*)

(* correct types
int list
*)

(* bad types
'a list
*)
