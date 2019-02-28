
let rec digitsOfInt n =
  if n <= 0 then [] else ((digitsOfInt n) / 10) @ [n mod 10];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,25)-(3,47)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (3,25)-(3,47)) (Var (Just (3,26)-(3,37)) "digitsOfInt") [Bop (Just (3,38)-(3,46)) Div (Var (Just (3,39)-(3,40)) "n") (Lit (Just (3,43)-(3,45)) (LI 10))]
*)

(* typed spans
(3,25)-(3,47)
*)

(* correct types
int list
*)

(* bad types
int
*)
