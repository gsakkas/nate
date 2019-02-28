
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,25)-(3,47)
n mod 10
BopG VarG LitG

*)

(* changed exprs
Bop (Just (3,25)-(3,35)) Mod (Var (Just (3,26)-(3,27)) "n") (Lit (Just (3,32)-(3,34)) (LI 10))
*)

(* typed spans
(3,25)-(3,35)
*)

(* correct types
int
*)

(* bad types
'a
*)
