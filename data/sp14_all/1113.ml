
let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> (n mod 10) :: ((digitsOfInt n) - 10);;


(* fix

let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(5,28)-(5,50)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (5,28)-(5,50)) (Var (Just (5,29)-(5,40)) "digitsOfInt") [Bop (Just (5,41)-(5,49)) Div (Var (Just (5,42)-(5,43)) "n") (Lit (Just (5,46)-(5,48)) (LI 10))]
*)

(* typed spans
(5,28)-(5,50)
*)

(* correct types
int list
*)

(* bad types
int
*)
