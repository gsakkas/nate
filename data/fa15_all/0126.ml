
let rec listReverse l =
  match l with | [] -> [] | t -> t | h::t -> t :: (listReverse [h]);;


(* fix

let rec listReverse l = match l with | [] -> [] | h::t -> [h];;

*)

(* changed spans
(3,2)-(3,67)
match l with
| [] -> []
| h :: t -> [h]
CaseG VarG (fromList [(Nothing,ListG EmptyG)])

*)

(* changed exprs
Case (Just (2,24)-(2,61)) (Var (Just (2,30)-(2,31)) "l") [(ConPat (Just (2,39)-(2,41)) "[]" Nothing,Nothing,List (Just (2,45)-(2,47)) [] Nothing),(ConsPat (Just (2,50)-(2,54)) (VarPat (Just (2,50)-(2,51)) "h") (VarPat (Just (2,53)-(2,54)) "t"),Nothing,List (Just (2,58)-(2,61)) [Var (Just (2,59)-(2,60)) "h"] Nothing)]
*)

(* typed spans
(2,24)-(2,61)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
