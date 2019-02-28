
let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10] @ [digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10] @ (digitsOfInt (n / 10));;

*)

(* changed spans
(3,38)-(3,60)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (3,38)-(3,60)) (Var (Just (3,39)-(3,50)) "digitsOfInt") [Bop (Just (3,51)-(3,59)) Div (Var (Just (3,52)-(3,53)) "n") (Lit (Just (3,56)-(3,58)) (LI 10))]
*)

(* typed spans
(3,38)-(3,60)
*)

(* correct types
int list
*)

(* bad types
int list
*)
