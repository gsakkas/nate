
let rec digitsOfInt n = if n <= 0 then [] else 1;;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else [1];;

*)

(* changed spans
(2,47)-(2,48)
[1]
ListG LitG

*)

(* changed exprs
List (Just (2,47)-(2,50)) [Lit (Just (2,48)-(2,49)) (LI 1)] Nothing
*)

(* typed spans
(2,47)-(2,50)
*)

(* correct types
int list
*)

(* bad types
int
*)
