
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((not f), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = if (f b) = b then (b, false) else ((f b), true) in
  wwhile (helper, b);;

*)

(* changed spans
(4,21)-(4,40)
let helper =
  fun b ->
    if f b = b
    then (b , false)
    else (f b , true) in
wwhile (helper , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (5,2)-(6,20)) NonRec [(VarPat (Just (5,6)-(5,12)) "helper",Lam (Just (5,13)-(5,64)) (VarPat (Just (5,13)-(5,14)) "b") (Ite (Just (5,17)-(5,64)) (Bop (Just (5,20)-(5,29)) Eq (App (Just (5,20)-(5,25)) (Var (Just (5,21)-(5,22)) "f") [Var (Just (5,23)-(5,24)) "b"]) (Var (Just (5,28)-(5,29)) "b")) (Tuple (Just (5,35)-(5,45)) [Var (Just (5,36)-(5,37)) "b",Lit (Just (5,39)-(5,44)) (LB False)]) (Tuple (Just (5,51)-(5,64)) [App (Just (5,52)-(5,57)) (Var (Just (5,53)-(5,54)) "f") [Var (Just (5,55)-(5,56)) "b"],Lit (Just (5,59)-(5,63)) (LB True)])) Nothing)] (App (Just (6,2)-(6,20)) (Var (Just (6,2)-(6,8)) "wwhile") [Tuple (Just (6,9)-(6,20)) [Var (Just (6,10)-(6,16)) "helper",Var (Just (6,18)-(6,19)) "b"]])
*)

(* typed spans
(5,2)-(6,20)
*)

(* correct types
'a
*)

(* bad types
'a
*)
