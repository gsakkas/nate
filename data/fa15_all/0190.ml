
let rec assoc (d,k,l) =
  match (d, k, l) with
  | (str,num)::t -> if str = k then num else assoc (d, k, t)
  | [] -> d;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | (ki,vi)::t -> if k = ki then vi else assoc (d, k, t)
  | [] -> d;;

*)

(* changed spans
(3,2)-(5,11)
match l with
| (ki , vi) :: t -> if k = ki
                    then vi
                    else assoc (d , k , t)
| [] -> d
CaseG VarG (fromList [(Nothing,VarG),(Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* changed exprs
Case (Just (3,2)-(5,11)) (Var (Just (3,8)-(3,9)) "l") [(ConsPat (Just (4,5)-(4,14)) (TuplePat (Just (4,5)-(4,10)) [VarPat (Just (4,5)-(4,7)) "ki",VarPat (Just (4,8)-(4,10)) "vi"]) (VarPat (Just (4,13)-(4,14)) "t"),Nothing,Ite (Just (4,18)-(4,56)) (Bop (Just (4,21)-(4,27)) Eq (Var (Just (4,21)-(4,22)) "k") (Var (Just (4,25)-(4,27)) "ki")) (Var (Just (4,33)-(4,35)) "vi") (App (Just (4,41)-(4,56)) (Var (Just (4,41)-(4,46)) "assoc") [Tuple (Just (4,47)-(4,56)) [Var (Just (4,48)-(4,49)) "d",Var (Just (4,51)-(4,52)) "k",Var (Just (4,54)-(4,55)) "t"]])),(ConPat (Just (5,4)-(5,6)) "[]" Nothing,Nothing,Var (Just (5,10)-(5,11)) "d")]
*)

(* typed spans
(3,2)-(5,11)
*)

(* correct types
'a
*)

(* bad types
'a
*)
