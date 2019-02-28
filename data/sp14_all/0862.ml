
let rec listReverse l =
  let l' = [] in
  match l with | [] -> l' | l -> (listReverse (List.tl l)) :: (List.hd l);;


(* fix

let rec listReverse l =
  let l' = [] in
  match l with | [] -> l' | h::t -> (List.hd l) :: (listReverse (List.tl l));;

*)

(* changed spans
(4,2)-(4,73)
match l with
| [] -> l'
| h :: t -> (List.hd l) :: (listReverse (List.tl l))
CaseG VarG (fromList [(Nothing,VarG),(Nothing,ConAppG (Just (TupleG (fromList [AppG (fromList [VarG]),AppG (fromList [AppG (fromList [VarG])])]))))])

*)

(* changed exprs
Case (Just (4,2)-(4,76)) (Var (Just (4,8)-(4,9)) "l") [(ConPat (Just (4,17)-(4,19)) "[]" Nothing,Nothing,Var (Just (4,23)-(4,25)) "l'"),(ConsPat (Just (4,28)-(4,32)) (VarPat (Just (4,28)-(4,29)) "h") (VarPat (Just (4,31)-(4,32)) "t"),Nothing,ConApp (Just (4,36)-(4,76)) "::" (Just (Tuple (Just (4,36)-(4,76)) [App (Just (4,36)-(4,47)) (Var (Just (4,37)-(4,44)) "List.hd") [Var (Just (4,45)-(4,46)) "l"],App (Just (4,51)-(4,76)) (Var (Just (4,52)-(4,63)) "listReverse") [App (Just (4,64)-(4,75)) (Var (Just (4,65)-(4,72)) "List.tl") [Var (Just (4,73)-(4,74)) "l"]]])) Nothing)]
*)

(* typed spans
(4,2)-(4,76)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
