
let rec digitsOfInt n =
  if n > 0 then ((digitsOfInt n) / 10) @ [n mod 10] else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [n; n mod 10] else [];;

*)

(* changed spans
(3,16)-(3,51)
[n ; n mod 10]
ListG VarG

*)

(* changed exprs
List (Just (2,38)-(2,51)) [Var (Just (2,39)-(2,40)) "n",Bop (Just (2,42)-(2,50)) Mod (Var (Just (2,42)-(2,43)) "n") (Lit (Just (2,48)-(2,50)) (LI 10))] Nothing
*)

(* typed spans
(2,38)-(2,51)
*)

(* correct types
int list
*)

(* bad types
'a list
*)
