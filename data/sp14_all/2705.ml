
let rec digitsOfInt n =
  if n > 0 then ((digitsOfInt n) / 10) :: (n mod 10) else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [n / 10; n mod 10] else [];;

*)

(* changed spans
(3,16)-(3,52)
[n / 10 ; n mod 10]
ListG (BopG EmptyG EmptyG)

*)

(* changed exprs
List (Just (2,38)-(2,56)) [Bop (Just (2,39)-(2,45)) Div (Var (Just (2,39)-(2,40)) "n") (Lit (Just (2,43)-(2,45)) (LI 10)),Bop (Just (2,47)-(2,55)) Mod (Var (Just (2,47)-(2,48)) "n") (Lit (Just (2,53)-(2,55)) (LI 10))] Nothing
*)

(* typed spans
(2,38)-(2,56)
*)

(* correct types
int list
*)

(* bad types
int list
*)
