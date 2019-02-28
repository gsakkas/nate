
let rec digitsOfInt n =
  if n < 0 then [] else [digitsOfInt (n / 10)] @ [n mod 10];;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [] @ [n mod 10];;

*)

(* changed spans
(3,24)-(3,46)
[]
ListG EmptyG

*)

(* changed exprs
List (Just (2,46)-(2,48)) [] Nothing
*)

(* typed spans
(2,46)-(2,48)
*)

(* correct types
int list
*)

(* bad types
int list
*)
