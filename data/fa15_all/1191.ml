
let rec wwhile (f,b) = match (f, b) with | h::t -> h;;


(* fix

let rec wwhile (f,b) = match f b with | (h,t) -> if t = false then h;;

*)

(* changed spans
(2,23)-(2,52)
match f b with
| (h , t) -> if t = false
             then h
             else ()
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* changed exprs
Case (Just (2,23)-(2,68)) (App (Just (2,29)-(2,32)) (Var (Just (2,29)-(2,30)) "f") [Var (Just (2,31)-(2,32)) "b"]) [(TuplePat (Just (2,41)-(2,44)) [VarPat (Just (2,41)-(2,42)) "h",VarPat (Just (2,43)-(2,44)) "t"],Nothing,Ite (Just (2,49)-(2,68)) (Bop (Just (2,52)-(2,61)) Eq (Var (Just (2,52)-(2,53)) "t") (Lit (Just (2,56)-(2,61)) (LB False))) (Var (Just (2,67)-(2,68)) "h") (ConApp (Just (2,49)-(2,68)) "()" Nothing (Just (TApp "unit" []))))]
*)

(* typed spans
(2,23)-(2,68)
*)

(* correct types
unit
*)

(* bad types
'a
*)
