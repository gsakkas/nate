
let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [] @ [digitsOfInt (n mod 10)]);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [] @ [n mod 10]);;

*)

(* changed spans
(3,52)-(3,74)
n mod 10
BopG VarG LitG

*)

(* changed exprs
Bop (Just (3,52)-(3,60)) Mod (Var (Just (3,52)-(3,53)) "n") (Lit (Just (3,58)-(3,60)) (LI 10))
*)

(* typed spans
(3,52)-(3,60)
*)

(* correct types
int
*)

(* bad types
'a
*)
