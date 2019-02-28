
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ (n mod 10));;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(5,63)-(5,73)
[n mod 10]
ListG (BopG EmptyG EmptyG)

*)

(* changed exprs
List (Just (5,63)-(5,73)) [Bop (Just (5,64)-(5,72)) Mod (Var (Just (5,64)-(5,65)) "n") (Lit (Just (5,70)-(5,72)) (LI 10))] Nothing
*)

(* typed spans
(5,63)-(5,73)
*)

(* correct types
int list
*)

(* bad types
int
*)
