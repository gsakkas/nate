
let rec listReverse l =
  match l with | [] -> [] | t::h::[] -> h :: (listReverse t);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | _::h::[] -> h :: (listReverse []);;

*)

(* changed spans
(3,2)-(3,60)
match l with
| [] -> []
| _ :: h :: [] -> h :: (listReverse [])
CaseG VarG (fromList [(Nothing,ConAppG (Just EmptyG)),(Nothing,ListG EmptyG)])

*)

(* changed exprs
Case (Just (3,2)-(3,61)) (Var (Just (3,8)-(3,9)) "l") [(ConPat (Just (3,17)-(3,19)) "[]" Nothing,Nothing,List (Just (3,23)-(3,25)) [] Nothing),(ConsPat (Just (3,28)-(3,36)) (WildPat (Just (3,28)-(3,29))) (ConsPat (Just (3,31)-(3,36)) (VarPat (Just (3,31)-(3,32)) "h") (ConPat (Just (3,34)-(3,36)) "[]" Nothing)),Nothing,ConApp (Just (3,40)-(3,61)) "::" (Just (Tuple (Just (3,40)-(3,61)) [Var (Just (3,40)-(3,41)) "h",App (Just (3,45)-(3,61)) (Var (Just (3,46)-(3,57)) "listReverse") [List (Just (3,58)-(3,60)) [] Nothing]])) Nothing)]
*)

(* typed spans
(3,2)-(3,61)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
