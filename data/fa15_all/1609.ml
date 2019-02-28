
let rec digitsOfInt n =
  if n < 0 then [] else [] @ (([n mod 10] digitsOfInt n) / 10);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [] @ [n mod 10];;

*)

(* changed spans
(3,29)-(3,62)
[n mod 10]
ListG (BopG EmptyG EmptyG)

*)

(* changed exprs
List (Just (2,51)-(2,61)) [Bop (Just (2,52)-(2,60)) Mod (Var (Just (2,52)-(2,53)) "n") (Lit (Just (2,58)-(2,60)) (LI 10))] Nothing
*)

(* typed spans
(2,51)-(2,61)
*)

(* correct types
int list
*)

(* bad types
int
*)
