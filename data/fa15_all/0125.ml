
let rec listReverse l =
  match l with | [] -> [] | t -> t | h::t -> h @ (listReverse t);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | t -> t | h::t -> t @ (listReverse [h]);;

*)

(* changed spans
(3,45)-(3,46)
t
VarG

(3,62)-(3,63)
[h]
ListG VarG

*)

(* changed exprs
Var (Just (3,45)-(3,46)) "t"
List (Just (3,62)-(3,65)) [Var (Just (3,63)-(3,64)) "h"] Nothing
*)

(* typed spans
(3,45)-(3,46)
(3,62)-(3,65)
*)

(* correct types
'a list
'a list
*)

(* bad types
'a list
'a list list
*)
