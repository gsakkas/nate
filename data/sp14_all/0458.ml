
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let ans = f b in ((ans, (ans <> b)), b));;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (let g x = let xx = f x in (xx, (xx != b)) in (g, b));;

*)

(* changed spans
(5,28)-(5,69)
let g =
  fun x ->
    (let xx = f x in
     (xx , xx <> b)) in
(g , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (6,9)-(6,62)) NonRec [(VarPat (Just (6,14)-(6,15)) "g",Lam (Just (6,16)-(6,51)) (VarPat (Just (6,16)-(6,17)) "x") (Let (Just (6,20)-(6,51)) NonRec [(VarPat (Just (6,24)-(6,26)) "xx",App (Just (6,29)-(6,32)) (Var (Just (6,29)-(6,30)) "f") [Var (Just (6,31)-(6,32)) "x"])] (Tuple (Just (6,36)-(6,51)) [Var (Just (6,37)-(6,39)) "xx",Bop (Just (6,41)-(6,50)) Neq (Var (Just (6,42)-(6,44)) "xx") (Var (Just (6,48)-(6,49)) "b")])) Nothing)] (Tuple (Just (6,55)-(6,61)) [Var (Just (6,56)-(6,57)) "g",Var (Just (6,59)-(6,60)) "b"])
*)

(* typed spans
(6,9)-(6,62)
*)

(* correct types
('a -> ('a * bool) * 'a)
*)

(* bad types
(('a * bool) * 'a)
*)
