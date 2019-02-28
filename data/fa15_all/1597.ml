
let rec digitsOfInt n = if n <= 0 then [] else (digitsOfInt n) / 10;;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else [n mod 10];;

*)

(* changed spans
(2,47)-(2,67)
[n mod 10]
ListG (BopG EmptyG EmptyG)

*)

(* changed exprs
List (Just (2,47)-(2,57)) [Bop (Just (2,48)-(2,56)) Mod (Var (Just (2,48)-(2,49)) "n") (Lit (Just (2,54)-(2,56)) (LI 10))] Nothing
*)

(* typed spans
(2,47)-(2,57)
*)

(* correct types
int list
*)

(* bad types
int
*)
