
let rec digitsOfInt n =
  if n <= 0
  then []
  else (match n with | n_ -> (digitsOfInt (n / 10)) :: (n_ mod 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else (match n with | n_ -> (n_ mod 10) :: (digitsOfInt (n / 10)));;

*)

(* changed spans
(5,29)-(5,51)
n_ mod 10
BopG VarG LitG

*)

(* changed exprs
Bop (Just (5,29)-(5,40)) Mod (Var (Just (5,30)-(5,32)) "n_") (Lit (Just (5,37)-(5,39)) (LI 10))
*)

(* typed spans
(5,29)-(5,40)
*)

(* correct types
int
*)

(* bad types
'a
*)
