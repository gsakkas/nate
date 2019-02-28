
let rec digitsOfInt n =
  if n > 10 then [digitsOfInt (n / 10); n mod 10] else n;;


(* fix

let rec digitsOfInt n = if n >= 100 then [n mod 10] else [n];;

*)

(* changed spans
(3,17)-(3,49)
n >= 100
BopG VarG LitG

(3,40)-(3,48)
[n mod 10]
ListG (BopG EmptyG EmptyG)

(3,55)-(3,56)
[n]
ListG VarG

*)

(* changed exprs
Bop (Just (2,27)-(2,35)) Ge (Var (Just (2,27)-(2,28)) "n") (Lit (Just (2,32)-(2,35)) (LI 100))
List (Just (2,41)-(2,51)) [Bop (Just (2,42)-(2,50)) Mod (Var (Just (2,42)-(2,43)) "n") (Lit (Just (2,48)-(2,50)) (LI 10))] Nothing
List (Just (2,57)-(2,60)) [Var (Just (2,58)-(2,59)) "n"] Nothing
*)

(* typed spans
(2,27)-(2,35)
(2,41)-(2,51)
(2,57)-(2,60)
*)

(* correct types
bool
int list
int list
*)

(* bad types
int list
int
int
*)
