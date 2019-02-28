
let rec digitsOfInt n = if n < 0 then [];;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [1];;

*)

(* changed spans
(2,24)-(2,40)
[1]
ListG LitG

*)

(* changed exprs
List (Just (2,46)-(2,49)) [Lit (Just (2,47)-(2,48)) (LI 1)] Nothing
*)

(* typed spans
(2,46)-(2,49)
*)

(* correct types
int list
*)

(* bad types
unit
*)
