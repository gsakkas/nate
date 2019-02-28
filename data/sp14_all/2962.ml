
let rec digitsOfInt n =
  if n > 0 then ((digitsOfInt n) / 10) @ [n mod 10] else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [2] else [1];;

*)

(* changed spans
(3,16)-(3,51)
[2]
ListG LitG

*)

(* changed exprs
List (Just (2,38)-(2,41)) [Lit (Just (2,39)-(2,40)) (LI 2)] Nothing
*)

(* typed spans
(2,38)-(2,41)
*)

(* correct types
int list
*)

(* bad types
'a list
*)
