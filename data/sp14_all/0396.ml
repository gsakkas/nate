
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile (((f b) <> b), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) =
  let f x = let xx = f b in (xx, (xx <> b)) in wwhile (f, b);;

*)

(* changed spans
(5,21)-(5,45)
let f =
  fun x ->
    (let xx = f b in
     (xx , xx <> b)) in
wwhile (f , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (6,2)-(6,60)) NonRec [(VarPat (Just (6,6)-(6,7)) "f",Lam (Just (6,8)-(6,43)) (VarPat (Just (6,8)-(6,9)) "x") (Let (Just (6,12)-(6,43)) NonRec [(VarPat (Just (6,16)-(6,18)) "xx",App (Just (6,21)-(6,24)) (Var (Just (6,21)-(6,22)) "f") [Var (Just (6,23)-(6,24)) "b"])] (Tuple (Just (6,28)-(6,43)) [Var (Just (6,29)-(6,31)) "xx",Bop (Just (6,33)-(6,42)) Neq (Var (Just (6,34)-(6,36)) "xx") (Var (Just (6,40)-(6,41)) "b")])) Nothing)] (App (Just (6,47)-(6,60)) (Var (Just (6,47)-(6,53)) "wwhile") [Tuple (Just (6,54)-(6,60)) [Var (Just (6,55)-(6,56)) "f",Var (Just (6,58)-(6,59)) "b"]])
*)

(* typed spans
(6,2)-(6,60)
*)

(* correct types
'a
*)

(* bad types
'a
*)
