
let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [digitsOfInt (n mod 10)]);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [n mod 10]);;

*)

(* changed spans
(3,47)-(3,69)
n mod 10
BopG VarG LitG

*)

(* changed exprs
Bop (Just (3,47)-(3,55)) Mod (Var (Just (3,47)-(3,48)) "n") (Lit (Just (3,53)-(3,55)) (LI 10))
*)

(* typed spans
(3,47)-(3,55)
*)

(* correct types
int
*)

(* bad types
'a
*)
