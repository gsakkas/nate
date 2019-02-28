
let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> (digitsOfInt (n / 10)) @ (n mod 10);;


(* fix

let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(5,39)-(5,49)
[n mod 10]
ListG (BopG EmptyG EmptyG)

*)

(* changed exprs
List (Just (5,39)-(5,49)) [Bop (Just (5,40)-(5,48)) Mod (Var (Just (5,40)-(5,41)) "n") (Lit (Just (5,46)-(5,48)) (LI 10))] Nothing
*)

(* typed spans
(5,39)-(5,49)
*)

(* correct types
int list
*)

(* bad types
int
*)
