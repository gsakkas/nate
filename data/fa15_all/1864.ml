
let rec digitsOfInt n = if n <= 0 then [] else (n mod 10) :: digitsOfInt;;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(2,61)-(2,72)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (3,39)-(3,61)) (Var (Just (3,40)-(3,51)) "digitsOfInt") [Bop (Just (3,52)-(3,60)) Div (Var (Just (3,53)-(3,54)) "n") (Lit (Just (3,57)-(3,59)) (LI 10))]
*)

(* typed spans
(3,39)-(3,61)
*)

(* correct types
int list
*)

(* bad types
int list
*)
