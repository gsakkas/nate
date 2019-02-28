
let rec digitsOfInt n = (n mod 10) :: ((digitsOfInt n) / 10);;


(* fix

let rec digitsOfInt n = (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(2,38)-(2,60)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (2,38)-(2,60)) (Var (Just (2,39)-(2,50)) "digitsOfInt") [Bop (Just (2,51)-(2,59)) Div (Var (Just (2,52)-(2,53)) "n") (Lit (Just (2,56)-(2,58)) (LI 10))]
*)

(* typed spans
(2,38)-(2,60)
*)

(* correct types
int list
*)

(* bad types
int
*)
