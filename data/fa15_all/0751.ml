
let rec digitsOfInt n =
  if n > 0 then [] else ((digitsOfInt n) / 10) @ [n mod 10];;


(* fix

let rec digitsOfInt n =
  if n > 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,24)-(3,46)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (3,24)-(3,46)) (Var (Just (3,25)-(3,36)) "digitsOfInt") [Bop (Just (3,37)-(3,45)) Div (Var (Just (3,38)-(3,39)) "n") (Lit (Just (3,42)-(3,44)) (LI 10))]
*)

(* typed spans
(3,24)-(3,46)
*)

(* correct types
int list
*)

(* bad types
int
*)
