
let rec listReverse l =
  match l with | h::t -> h :: (l listReverse t) | [] -> l;;


(* fix

let rec listReverse l = match l with | [] -> l | h::t -> h :: (listReverse t);;

*)

(* changed spans
(3,2)-(3,57)
match l with
| [] -> l
| h :: t -> h :: (listReverse t)
CaseG VarG (fromList [(Nothing,VarG),(Nothing,ConAppG (Just (TupleG (fromList [VarG,AppG (fromList [VarG])]))))])

*)

(* changed exprs
Case (Just (2,24)-(2,77)) (Var (Just (2,30)-(2,31)) "l") [(ConPat (Just (2,39)-(2,41)) "[]" Nothing,Nothing,Var (Just (2,45)-(2,46)) "l"),(ConsPat (Just (2,49)-(2,53)) (VarPat (Just (2,49)-(2,50)) "h") (VarPat (Just (2,52)-(2,53)) "t"),Nothing,ConApp (Just (2,57)-(2,77)) "::" (Just (Tuple (Just (2,57)-(2,77)) [Var (Just (2,57)-(2,58)) "h",App (Just (2,62)-(2,77)) (Var (Just (2,63)-(2,74)) "listReverse") [Var (Just (2,75)-(2,76)) "t"]])) Nothing)]
*)

(* typed spans
(2,24)-(2,77)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
