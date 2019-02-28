
let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> (digitsOfInt (n / 10)) :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(5,14)-(5,36)
n mod 10
BopG VarG LitG

*)

(* changed exprs
Bop (Just (5,14)-(5,24)) Mod (Var (Just (5,15)-(5,16)) "n") (Lit (Just (5,21)-(5,23)) (LI 10))
*)

(* typed spans
(5,14)-(5,24)
*)

(* correct types
int
*)

(* bad types
'a
*)
