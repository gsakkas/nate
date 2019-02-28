
let rec listReverse l =
  match l with | [] -> [] | h1 -> [h1] | h::t -> h :: (listReverse t);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h1::[] -> [h1] | h::t -> h :: (listReverse t);;

*)

(* changed spans
(3,2)-(3,69)
match l with
| [] -> []
| h1 :: [] -> [h1]
| h :: t -> h :: (listReverse t)
CaseG VarG (fromList [(Nothing,ConAppG (Just EmptyG)),(Nothing,ListG EmptyG)])

*)

(* changed exprs
Case (Just (3,2)-(3,73)) (Var (Just (3,8)-(3,9)) "l") [(ConPat (Just (3,17)-(3,19)) "[]" Nothing,Nothing,List (Just (3,23)-(3,25)) [] Nothing),(ConsPat (Just (3,28)-(3,34)) (VarPat (Just (3,28)-(3,30)) "h1") (ConPat (Just (3,32)-(3,34)) "[]" Nothing),Nothing,List (Just (3,38)-(3,42)) [Var (Just (3,39)-(3,41)) "h1"] Nothing),(ConsPat (Just (3,45)-(3,49)) (VarPat (Just (3,45)-(3,46)) "h") (VarPat (Just (3,48)-(3,49)) "t"),Nothing,ConApp (Just (3,53)-(3,73)) "::" (Just (Tuple (Just (3,53)-(3,73)) [Var (Just (3,53)-(3,54)) "h",App (Just (3,58)-(3,73)) (Var (Just (3,59)-(3,70)) "listReverse") [Var (Just (3,71)-(3,72)) "t"]])) Nothing)]
*)

(* typed spans
(3,2)-(3,73)
*)

(* correct types
'a list
*)

(* bad types
'a list list
*)
