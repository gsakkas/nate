
let rec app x y = match x with | [] -> y | h::t -> h :: (app t y);;

let rec digitsOfInt n =
  if n >= 10 then app digitsOfInt (n / 10) [n mod 10] else [n];;


(* fix

let rec digitsOfInt n =
  if n >= 10 then (digitsOfInt (n / 10)) @ [n mod 10] else [n];;

*)

(* changed spans
(5,18)-(5,53)
digitsOfInt (n / 10) @ [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (3,18)-(3,53)) (Var (Just (3,41)-(3,42)) "@") [App (Just (3,18)-(3,40)) (Var (Just (3,19)-(3,30)) "digitsOfInt") [Bop (Just (3,31)-(3,39)) Div (Var (Just (3,32)-(3,33)) "n") (Lit (Just (3,36)-(3,38)) (LI 10))],List (Just (3,43)-(3,53)) [Bop (Just (3,44)-(3,52)) Mod (Var (Just (3,44)-(3,45)) "n") (Lit (Just (3,50)-(3,52)) (LI 10))] Nothing]
*)

(* typed spans
(3,18)-(3,53)
*)

(* correct types
int list
*)

(* bad types
int list
*)
