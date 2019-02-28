
let rec listReverse l =
  match l with | [] -> [] | h1::[] -> [h1] | h::t -> t :: (listReverse t);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h1::[] -> [h1] | h::t -> h :: (listReverse t);;

*)

(* changed spans
(3,53)-(3,54)
h
VarG

*)

(* changed exprs
Var (Just (3,53)-(3,54)) "h"
*)

(* typed spans
(3,53)-(3,54)
*)

(* correct types
'a
*)

(* bad types
'a list
*)
