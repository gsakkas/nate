
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let result = f b in if result = b then b else wwhile (f, result);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let foo b =
    let result = f b in
    if result = b then (result, false) else (result, true) in
  wwhile (foo, b);;

*)

(* changed spans
(5,2)-(5,66)
let foo =
  fun b ->
    (let result = f b in
     if result = b
     then (result , false)
     else (result , true)) in
wwhile (foo , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (5,2)-(8,17)) NonRec [(VarPat (Just (5,6)-(5,9)) "foo",Lam (Just (5,10)-(7,58)) (VarPat (Just (5,10)-(5,11)) "b") (Let (Just (6,4)-(7,58)) NonRec [(VarPat (Just (6,8)-(6,14)) "result",App (Just (6,17)-(6,20)) (Var (Just (6,17)-(6,18)) "f") [Var (Just (6,19)-(6,20)) "b"])] (Ite (Just (7,4)-(7,58)) (Bop (Just (7,7)-(7,17)) Eq (Var (Just (7,7)-(7,13)) "result") (Var (Just (7,16)-(7,17)) "b")) (Tuple (Just (7,23)-(7,38)) [Var (Just (7,24)-(7,30)) "result",Lit (Just (7,32)-(7,37)) (LB False)]) (Tuple (Just (7,44)-(7,58)) [Var (Just (7,45)-(7,51)) "result",Lit (Just (7,53)-(7,57)) (LB True)]))) Nothing)] (App (Just (8,2)-(8,17)) (Var (Just (8,2)-(8,8)) "wwhile") [Tuple (Just (8,9)-(8,17)) [Var (Just (8,10)-(8,13)) "foo",Var (Just (8,15)-(8,16)) "b"]])
*)

(* typed spans
(5,2)-(8,17)
*)

(* correct types
'a
*)

(* bad types
'a
*)
