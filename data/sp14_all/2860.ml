
let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n = 0
    then [0]
    else if (List.length ((digitsOfInt (n / 10)) @ [n mod 10])) = 0 then [];;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else if n = 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(8,9)-(8,75)
[]
ListG EmptyG

*)

(* changed exprs
List (Just (5,21)-(5,23)) [] Nothing
*)

(* typed spans
(5,21)-(5,23)
*)

(* correct types
int list
*)

(* bad types
unit
*)
