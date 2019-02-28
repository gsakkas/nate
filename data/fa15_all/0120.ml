
let rec listReverse l =
  match l with | [] -> [] | h -> [h] | h::t -> t @ (listReverse h);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h -> h | h::t -> t @ (listReverse [h]);;

*)

(* changed spans
(3,33)-(3,36)
h
VarG

(3,52)-(3,63)
[h]
ListG VarG

*)

(* changed exprs
Var (Just (3,33)-(3,34)) "h"
List (Just (3,62)-(3,65)) [Var (Just (3,63)-(3,64)) "h"] Nothing
*)

(* typed spans
(3,33)-(3,34)
(3,62)-(3,65)
*)

(* correct types
'a list
'a list
*)

(* bad types
'a list list
'a -> 'a list
*)
