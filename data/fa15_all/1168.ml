
let rec assoc (d,k,l) =
  match [(k, d)] with
  | [] -> d
  | h::t -> if [(k, d)] = h then d else assoc (d, k, t);;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | (k',d')::t -> if k = k' then d' else assoc (d, k, t);;

*)

(* changed spans
(3,2)-(5,55)
match l with
| [] -> d
| (k' , d') :: t -> if k = k'
                    then d'
                    else assoc (d , k , t)
CaseG VarG (fromList [(Nothing,VarG),(Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* changed exprs
Case (Just (3,2)-(5,56)) (Var (Just (3,8)-(3,9)) "l") [(ConPat (Just (4,4)-(4,6)) "[]" Nothing,Nothing,Var (Just (4,10)-(4,11)) "d"),(ConsPat (Just (5,5)-(5,14)) (TuplePat (Just (5,5)-(5,10)) [VarPat (Just (5,5)-(5,7)) "k'",VarPat (Just (5,8)-(5,10)) "d'"]) (VarPat (Just (5,13)-(5,14)) "t"),Nothing,Ite (Just (5,18)-(5,56)) (Bop (Just (5,21)-(5,27)) Eq (Var (Just (5,21)-(5,22)) "k") (Var (Just (5,25)-(5,27)) "k'")) (Var (Just (5,33)-(5,35)) "d'") (App (Just (5,41)-(5,56)) (Var (Just (5,41)-(5,46)) "assoc") [Tuple (Just (5,47)-(5,56)) [Var (Just (5,48)-(5,49)) "d",Var (Just (5,51)-(5,52)) "k",Var (Just (5,54)-(5,55)) "t"]]))]
*)

(* typed spans
(3,2)-(5,56)
*)

(* correct types
'a
*)

(* bad types
'a
*)
