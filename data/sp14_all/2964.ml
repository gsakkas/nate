
let rec digitsOfInt n = if n > 0 then (digitsOfInt n) / 10 else [1];;


(* fix

let rec digitsOfInt n = if n > 0 then [2] else [1];;

*)

(* changed spans
(2,64)-(2,67)
2
LitG

(2,64)-(2,67)
[1]
ListG LitG

*)

(* changed exprs
Lit (Just (2,39)-(2,40)) (LI 2)
List (Just (2,47)-(2,50)) [Lit (Just (2,48)-(2,49)) (LI 1)] Nothing
*)

(* typed spans
(2,39)-(2,40)
(2,47)-(2,50)
*)

(* correct types
int
int list
*)

(* bad types
int list
int list
*)
