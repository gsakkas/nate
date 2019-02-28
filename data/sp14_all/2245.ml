
let rec wwhile (f,b) =
  let (b',c') = f b in if not c' then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((fun f'  -> if (f b) = b then (b, true) else (b, false)), b);;

*)

(* changed spans
(3,23)-(3,60)
match c' with
| false -> b'
| _ -> wwhile (f , b')
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG]))])

(5,29)-(5,31)
fun f' ->
  if f b = b
  then (b , true)
  else (b , false)
LamG (IteG EmptyG EmptyG EmptyG)

*)

(* changed exprs
Case (Just (3,23)-(3,73)) (Var (Just (3,29)-(3,31)) "c'") [(LitPat (Just (3,39)-(3,44)) (LB False),Nothing,Var (Just (3,49)-(3,51)) "b'"),(WildPat (Just (3,54)-(3,55)),Nothing,App (Just (3,59)-(3,73)) (Var (Just (3,59)-(3,65)) "wwhile") [Tuple (Just (3,66)-(3,73)) [Var (Just (3,67)-(3,68)) "f",Var (Just (3,70)-(3,72)) "b'"]])]
Lam (Just (6,10)-(6,66)) (VarPat (Just (6,15)-(6,17)) "f'") (Ite (Just (6,22)-(6,65)) (Bop (Just (6,25)-(6,34)) Eq (App (Just (6,25)-(6,30)) (Var (Just (6,26)-(6,27)) "f") [Var (Just (6,28)-(6,29)) "b"]) (Var (Just (6,33)-(6,34)) "b")) (Tuple (Just (6,40)-(6,49)) [Var (Just (6,41)-(6,42)) "b",Lit (Just (6,44)-(6,48)) (LB True)]) (Tuple (Just (6,55)-(6,65)) [Var (Just (6,56)-(6,57)) "b",Lit (Just (6,59)-(6,64)) (LB False)])) Nothing
*)

(* typed spans
(3,23)-(3,73)
(6,10)-(6,66)
*)

(* correct types
'a
'a -> ('a * bool)
*)

(* bad types
'a
unit
*)
