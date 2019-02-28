
let rec digitsOfInt n = if n < 0 then [] else (digitsOfInt n) / 1;;


(* fix

let rec digitsOfInt n = if n < 0 then [] else digitsOfInt (n / 10);;

*)

(* changed spans
(2,46)-(2,65)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (2,46)-(2,66)) (Var (Just (2,46)-(2,57)) "digitsOfInt") [Bop (Just (2,58)-(2,66)) Div (Var (Just (2,59)-(2,60)) "n") (Lit (Just (2,63)-(2,65)) (LI 10))]
*)

(* typed spans
(2,46)-(2,66)
*)

(* correct types
'a list
*)

(* bad types
int
*)
