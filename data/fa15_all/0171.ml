
let rec digitsOfInt n = if n > 0 then [digitsOfInt (n mod 10)] else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [n mod 100; n mod 10] else [];;

*)

(* changed spans
(2,38)-(2,62)
[n mod 100 ; n mod 10]
ListG (BopG EmptyG EmptyG)

*)

(* changed exprs
List (Just (2,38)-(2,59)) [Bop (Just (2,39)-(2,48)) Mod (Var (Just (2,39)-(2,40)) "n") (Lit (Just (2,45)-(2,48)) (LI 100)),Bop (Just (2,50)-(2,58)) Mod (Var (Just (2,50)-(2,51)) "n") (Lit (Just (2,56)-(2,58)) (LI 10))] Nothing
*)

(* typed spans
(2,38)-(2,59)
*)

(* correct types
int list
*)

(* bad types
'a list
*)
