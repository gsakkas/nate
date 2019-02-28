
let rec digitsOfInt n = if n < 0 then [7];;


(* fix

let rec digitsOfInt n = if n < 0 then [7] else [8];;

*)

(* changed spans
(2,24)-(2,41)
[8]
ListG LitG

*)

(* changed exprs
List (Just (2,47)-(2,50)) [Lit (Just (2,48)-(2,49)) (LI 8)] Nothing
*)

(* typed spans
(2,47)-(2,50)
*)

(* correct types
int list
*)

(* bad types
unit
*)
