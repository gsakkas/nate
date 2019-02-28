
let rec digitsOfInt n =
  if n < 0 then [] else if n < 10 then [n] else (digitsOfInt n) / 10;;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else if n < 10 then [n] else digitsOfInt (n / 10);;

*)

(* changed spans
(3,48)-(3,68)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (3,48)-(3,68)) (Var (Just (3,48)-(3,59)) "digitsOfInt") [Bop (Just (3,60)-(3,68)) Div (Var (Just (3,61)-(3,62)) "n") (Lit (Just (3,65)-(3,67)) (LI 10))]
*)

(* typed spans
(3,48)-(3,68)
*)

(* correct types
int list
*)

(* bad types
int
*)
