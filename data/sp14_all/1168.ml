
let rec listReverse l = match l with | [] -> [] | a::b::[] -> 0;;


(* fix

let rec listReverse l = match l with | [] -> [] | a::b::[] -> [a];;

*)

(* changed spans
(2,62)-(2,63)
[a]
ListG VarG

*)

(* changed exprs
List (Just (2,62)-(2,65)) [Var (Just (2,63)-(2,64)) "a"] Nothing
*)

(* typed spans
(2,62)-(2,65)
*)

(* correct types
'a list
*)

(* bad types
int
*)
