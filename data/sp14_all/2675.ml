
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    (let f' b' = let bb = f b in (bb, (bb = (f b))) in ((wwhile (f', b)), b));;


(* fix

let fixpoint (f,b) =
  let rec helper (f,b) =
    let b' = f b in if b' = b then b' else helper (f, b') in
  helper (f, b);;

*)

(* changed spans
(2,23)-(2,77)
let rec helper =
  fun (f , b) ->
    (let b' = f b in
     if b' = b
     then b'
     else helper (f , b')) in
helper (f , b)
LetG Rec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (3,2)-(5,15)) Rec [(VarPat (Just (3,10)-(3,16)) "helper",Lam (Just (3,18)-(4,57)) (TuplePat (Just (3,18)-(3,21)) [VarPat (Just (3,18)-(3,19)) "f",VarPat (Just (3,20)-(3,21)) "b"]) (Let (Just (4,4)-(4,57)) NonRec [(VarPat (Just (4,8)-(4,10)) "b'",App (Just (4,13)-(4,16)) (Var (Just (4,13)-(4,14)) "f") [Var (Just (4,15)-(4,16)) "b"])] (Ite (Just (4,20)-(4,57)) (Bop (Just (4,23)-(4,29)) Eq (Var (Just (4,23)-(4,25)) "b'") (Var (Just (4,28)-(4,29)) "b")) (Var (Just (4,35)-(4,37)) "b'") (App (Just (4,43)-(4,57)) (Var (Just (4,43)-(4,49)) "helper") [Tuple (Just (4,50)-(4,57)) [Var (Just (4,51)-(4,52)) "f",Var (Just (4,54)-(4,56)) "b'"]]))) Nothing)] (App (Just (5,2)-(5,15)) (Var (Just (5,2)-(5,8)) "helper") [Tuple (Just (5,9)-(5,15)) [Var (Just (5,10)-(5,11)) "f",Var (Just (5,13)-(5,14)) "b"]])
*)

(* typed spans
(3,2)-(5,15)
*)

(* correct types
'a
*)

(* bad types
'a
*)
