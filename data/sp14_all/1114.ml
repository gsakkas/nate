
let rec listReverse l =
  match l with | h::[] -> h | h::t -> [listReverse t; h];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> h :: (listReverse t);;

*)

(* changed spans
(3,2)-(3,56)
match l with
| [] -> []
| h :: t -> h :: (listReverse t)
CaseG VarG (fromList [(Nothing,ConAppG (Just EmptyG)),(Nothing,ListG EmptyG)])

*)

(* changed exprs
Case (Just (3,2)-(3,56)) (Var (Just (3,8)-(3,9)) "l") [(ConPat (Just (3,17)-(3,19)) "[]" Nothing,Nothing,List (Just (3,23)-(3,25)) [] Nothing),(ConsPat (Just (3,28)-(3,32)) (VarPat (Just (3,28)-(3,29)) "h") (VarPat (Just (3,31)-(3,32)) "t"),Nothing,ConApp (Just (3,36)-(3,56)) "::" (Just (Tuple (Just (3,36)-(3,56)) [Var (Just (3,36)-(3,37)) "h",App (Just (3,41)-(3,56)) (Var (Just (3,42)-(3,53)) "listReverse") [Var (Just (3,54)-(3,55)) "t"]])) Nothing)]
*)

(* typed spans
(3,2)-(3,56)
*)

(* correct types
'a list
*)

(* bad types
'a
*)
