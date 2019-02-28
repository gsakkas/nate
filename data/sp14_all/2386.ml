
let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: ((digitsOfInt n) / 10) else [];;


(* fix

let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [];;

*)

(* changed spans
(3,30)-(3,52)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (3,30)-(3,52)) (Var (Just (3,31)-(3,42)) "digitsOfInt") [Bop (Just (3,43)-(3,51)) Div (Var (Just (3,44)-(3,45)) "n") (Lit (Just (3,48)-(3,50)) (LI 10))]
*)

(* typed spans
(3,30)-(3,52)
*)

(* correct types
int list
*)

(* bad types
int
*)
