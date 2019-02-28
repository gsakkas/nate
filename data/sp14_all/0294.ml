
let rec listReverse l = match l with | [] -> [l] | h::t -> [listReverse t; h];;


(* fix

let rec listReverse l =
  match l with | h::t -> h :: (listReverse t) | [] -> [];;

*)

(* changed spans
(2,24)-(2,77)
match l with
| h :: t -> h :: (listReverse t)
| [] -> []
CaseG VarG (fromList [(Nothing,ConAppG (Just EmptyG)),(Nothing,ListG EmptyG)])

*)

(* changed exprs
Case (Just (3,2)-(3,56)) (Var (Just (3,8)-(3,9)) "l") [(ConsPat (Just (3,17)-(3,21)) (VarPat (Just (3,17)-(3,18)) "h") (VarPat (Just (3,20)-(3,21)) "t"),Nothing,ConApp (Just (3,25)-(3,45)) "::" (Just (Tuple (Just (3,25)-(3,45)) [Var (Just (3,25)-(3,26)) "h",App (Just (3,30)-(3,45)) (Var (Just (3,31)-(3,42)) "listReverse") [Var (Just (3,43)-(3,44)) "t"]])) Nothing),(ConPat (Just (3,48)-(3,50)) "[]" Nothing,Nothing,List (Just (3,54)-(3,56)) [] Nothing)]
*)

(* typed spans
(3,2)-(3,56)
*)

(* correct types
'a list
*)

(* bad types
'a list list
*)
