
let rec listReverse l =
  match l with | x::[] -> x | hd::tl -> (listReverse tl) :: hd;;


(* fix

let rec last l = match l with | x::[] -> x | hd::tl -> last tl | [] -> [];;

let rec removeLast l =
  match l with | x::[] -> [] | hd::tl -> hd :: (removeLast tl) | [] -> [];;

let rec listReverse l = (last l) :: (listReverse (removeLast l));;

*)

(* changed spans
(3,2)-(3,62)
match l with
| x :: [] -> x
| hd :: tl -> last tl
| [] -> []
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG)])

(3,60)-(3,62)
fun l ->
  match l with
  | x :: [] -> []
  | hd :: tl -> hd :: (removeLast tl)
  | [] -> []
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

*)

(* changed exprs
Case (Just (2,17)-(2,73)) (Var (Just (2,23)-(2,24)) "l") [(ConsPat (Just (2,32)-(2,37)) (VarPat (Just (2,32)-(2,33)) "x") (ConPat (Just (2,35)-(2,37)) "[]" Nothing),Nothing,Var (Just (2,41)-(2,42)) "x"),(ConsPat (Just (2,45)-(2,51)) (VarPat (Just (2,45)-(2,47)) "hd") (VarPat (Just (2,49)-(2,51)) "tl"),Nothing,App (Just (2,55)-(2,62)) (Var (Just (2,55)-(2,59)) "last") [Var (Just (2,60)-(2,62)) "tl"]),(ConPat (Just (2,65)-(2,67)) "[]" Nothing,Nothing,List (Just (2,71)-(2,73)) [] Nothing)]
Lam (Just (4,19)-(5,73)) (VarPat (Just (4,19)-(4,20)) "l") (Case (Just (5,2)-(5,73)) (Var (Just (5,8)-(5,9)) "l") [(ConsPat (Just (5,17)-(5,22)) (VarPat (Just (5,17)-(5,18)) "x") (ConPat (Just (5,20)-(5,22)) "[]" Nothing),Nothing,List (Just (5,26)-(5,28)) [] Nothing),(ConsPat (Just (5,31)-(5,37)) (VarPat (Just (5,31)-(5,33)) "hd") (VarPat (Just (5,35)-(5,37)) "tl"),Nothing,ConApp (Just (5,41)-(5,62)) "::" (Just (Tuple (Just (5,41)-(5,62)) [Var (Just (5,41)-(5,43)) "hd",App (Just (5,47)-(5,62)) (Var (Just (5,48)-(5,58)) "removeLast") [Var (Just (5,59)-(5,61)) "tl"]])) Nothing),(ConPat (Just (5,65)-(5,67)) "[]" Nothing,Nothing,List (Just (5,71)-(5,73)) [] Nothing)]) Nothing
*)

(* typed spans
(2,17)-(2,73)
(4,19)-(5,73)
*)

(* correct types
'a list
'a list list -> 'a list list
*)

(* bad types
'a list
'a list
*)
