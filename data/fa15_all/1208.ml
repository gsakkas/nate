
let rec wwhile (f,b) = match f b with | (h,t) -> if t = true then f h;;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' = false then b' else wwhile (f, b');;

*)

(* changed spans
(2,23)-(2,69)
match f b with
| (b' , c') -> if c' = false
               then b'
               else wwhile (f , b')
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* changed exprs
Case (Just (3,2)-(3,71)) (App (Just (3,8)-(3,11)) (Var (Just (3,8)-(3,9)) "f") [Var (Just (3,10)-(3,11)) "b"]) [(TuplePat (Just (3,20)-(3,25)) [VarPat (Just (3,20)-(3,22)) "b'",VarPat (Just (3,23)-(3,25)) "c'"],Nothing,Ite (Just (3,30)-(3,71)) (Bop (Just (3,33)-(3,43)) Eq (Var (Just (3,33)-(3,35)) "c'") (Lit (Just (3,38)-(3,43)) (LB False))) (Var (Just (3,49)-(3,51)) "b'") (App (Just (3,57)-(3,71)) (Var (Just (3,57)-(3,63)) "wwhile") [Tuple (Just (3,64)-(3,71)) [Var (Just (3,65)-(3,66)) "f",Var (Just (3,68)-(3,70)) "b'"]]))]
*)

(* typed spans
(3,2)-(3,71)
*)

(* correct types
'a
*)

(* bad types
unit
*)
