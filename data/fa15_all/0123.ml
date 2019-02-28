
let rec listReverse l =
  match l with | [] -> [] | t -> t | h::t -> h @ (listReverse [t]);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | t -> t | h::t -> t @ (listReverse [h]);;

*)

(* changed spans
(3,45)-(3,46)
t
VarG

(3,63)-(3,64)
h
VarG

*)

(* changed exprs
Var (Just (3,45)-(3,46)) "t"
Var (Just (3,63)-(3,64)) "h"
*)

(* typed spans
(3,45)-(3,46)
(3,63)-(3,64)
*)

(* correct types
'a list
'a
*)

(* bad types
'a list
'a list list
*)
