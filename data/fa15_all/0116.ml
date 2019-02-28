
let rec listReverse l =
  match l with | [] -> [] | h::t -> t :: (listReverse h);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h -> h | h::t -> t @ (listReverse [h]);;

*)

(* changed spans
(3,2)-(3,56)
match l with
| [] -> []
| h -> h
| h :: t -> t @ listReverse [h]
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG)])

*)

(* changed exprs
Case (Just (3,2)-(3,66)) (Var (Just (3,8)-(3,9)) "l") [(ConPat (Just (3,17)-(3,19)) "[]" Nothing,Nothing,List (Just (3,23)-(3,25)) [] Nothing),(VarPat (Just (3,28)-(3,29)) "h",Nothing,Var (Just (3,33)-(3,34)) "h"),(ConsPat (Just (3,37)-(3,41)) (VarPat (Just (3,37)-(3,38)) "h") (VarPat (Just (3,40)-(3,41)) "t"),Nothing,App (Just (3,45)-(3,66)) (Var (Just (3,47)-(3,48)) "@") [Var (Just (3,45)-(3,46)) "t",App (Just (3,49)-(3,66)) (Var (Just (3,50)-(3,61)) "listReverse") [List (Just (3,62)-(3,65)) [Var (Just (3,63)-(3,64)) "h"] Nothing]])]
*)

(* typed spans
(3,2)-(3,66)
*)

(* correct types
'a list
*)

(* bad types
'a list list
*)
