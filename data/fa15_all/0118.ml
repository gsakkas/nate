
let rec listReverse l =
  match l with | [] -> [] | h -> [h] | h::t -> h :: (listReverse [t]);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h -> h | h::t -> t @ (listReverse [h]);;

*)

(* changed spans
(3,33)-(3,36)
h
VarG

(3,47)-(3,69)
t @ listReverse [h]
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
Var (Just (3,33)-(3,34)) "h"
App (Just (3,45)-(3,66)) (Var (Just (3,47)-(3,48)) "@") [Var (Just (3,45)-(3,46)) "t",App (Just (3,49)-(3,66)) (Var (Just (3,50)-(3,61)) "listReverse") [List (Just (3,62)-(3,65)) [Var (Just (3,63)-(3,64)) "h"] Nothing]]
*)

(* typed spans
(3,33)-(3,34)
(3,45)-(3,66)
*)

(* correct types
'a list
'a list
*)

(* bad types
'a list list
'a list
*)
