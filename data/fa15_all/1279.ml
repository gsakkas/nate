
let rec digitsOfInt n = if n < 0 then [];;


(* fix

let rec digitsOfInt n = if n < 0 then [7] else [8];;

*)

(* changed spans
(2,24)-(2,40)
[7]
ListG LitG

*)

(* changed exprs
List (Just (2,38)-(2,41)) [Lit (Just (2,39)-(2,40)) (LI 7)] Nothing
*)

(* typed spans
(2,38)-(2,41)
*)

(* correct types
int list
*)

(* bad types
unit
*)
