
let rec digitsOfInt n =
  if n < 0 then [] else (n mod 10) :: [] :: ((digitsOfInt n) / 10);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [n mod 10];;

*)

(* changed spans
(3,24)-(3,66)
[n mod 10]
ListG (BopG EmptyG EmptyG)

*)

(* changed exprs
List (Just (2,46)-(2,56)) [Bop (Just (2,47)-(2,55)) Mod (Var (Just (2,47)-(2,48)) "n") (Lit (Just (2,53)-(2,55)) (LI 10))] Nothing
*)

(* typed spans
(2,46)-(2,56)
*)

(* correct types
int list
*)

(* bad types
int list
*)
