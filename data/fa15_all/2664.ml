
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let f' b = (f b) = b in wwhile (f', b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = if (f b) = b then (true, (f b)) else (false, (f b)) in
  wwhile (helper, b);;

*)

(* changed spans
(4,21)-(4,59)
let helper =
  fun b ->
    if f b = b
    then (true , f b)
    else (false , f b) in
wwhile (helper , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (5,2)-(6,20)) NonRec [(VarPat (Just (5,6)-(5,12)) "helper",Lam (Just (5,13)-(5,68)) (VarPat (Just (5,13)-(5,14)) "b") (Ite (Just (5,17)-(5,68)) (Bop (Just (5,20)-(5,29)) Eq (App (Just (5,20)-(5,25)) (Var (Just (5,21)-(5,22)) "f") [Var (Just (5,23)-(5,24)) "b"]) (Var (Just (5,28)-(5,29)) "b")) (Tuple (Just (5,35)-(5,48)) [Lit (Just (5,36)-(5,40)) (LB True),App (Just (5,42)-(5,47)) (Var (Just (5,43)-(5,44)) "f") [Var (Just (5,45)-(5,46)) "b"]]) (Tuple (Just (5,54)-(5,68)) [Lit (Just (5,55)-(5,60)) (LB False),App (Just (5,62)-(5,67)) (Var (Just (5,63)-(5,64)) "f") [Var (Just (5,65)-(5,66)) "b"]])) Nothing)] (App (Just (6,2)-(6,20)) (Var (Just (6,2)-(6,8)) "wwhile") [Tuple (Just (6,9)-(6,20)) [Var (Just (6,10)-(6,16)) "helper",Var (Just (6,18)-(6,19)) "b"]])
*)

(* typed spans
(5,2)-(6,20)
*)

(* correct types
bool
*)

(* bad types
'a
*)
