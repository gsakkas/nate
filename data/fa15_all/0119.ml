
let rec listReverse l =
  match l with | [] -> [] | h -> [h] | h::t -> t @ (listReverse [h]);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h -> h | h::t -> t @ (listReverse [h]);;

*)

(* changed spans
(3,33)-(3,36)
h
VarG

*)

(* changed exprs
Var (Just (3,33)-(3,34)) "h"
*)

(* typed spans
(3,33)-(3,34)
*)

(* correct types
'a list
*)

(* bad types
'a list list
*)
