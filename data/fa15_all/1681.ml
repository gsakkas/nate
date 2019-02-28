
let rec digitsOfInt n =
  if n < 0 then [] else (let x = n mod 10 in (digitsOfInt n) @ x);;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (let x = n mod 10 in (digitsOfInt n) @ [x]);;

*)

(* changed spans
(3,63)-(3,64)
[x]
ListG VarG

*)

(* changed exprs
List (Just (3,63)-(3,66)) [Var (Just (3,64)-(3,65)) "x"] Nothing
*)

(* typed spans
(3,63)-(3,66)
*)

(* correct types
int list
*)

(* bad types
int
*)
