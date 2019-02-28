
let rec wwhile (f,b) =
  match f b with | (b',true ) -> wwhile (f, b') | (b',false ) -> b';;

let fixpoint (f,b) = wwhile (((f b), (b <> (f b))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',true ) -> wwhile (f, b') | (b',false ) -> b';;

let fixpoint (f,b) =
  let f b = let b' = f b in (b', ((f b) <> b)) in wwhile (f, b);;

*)

(* changed spans
(5,21)-(5,54)
let f =
  fun b ->
    (let b' = f b in
     (b' , f b <> b)) in
wwhile (f , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (6,2)-(6,63)) NonRec [(VarPat (Just (6,6)-(6,7)) "f",Lam (Just (6,8)-(6,46)) (VarPat (Just (6,8)-(6,9)) "b") (Let (Just (6,12)-(6,46)) NonRec [(VarPat (Just (6,16)-(6,18)) "b'",App (Just (6,21)-(6,24)) (Var (Just (6,21)-(6,22)) "f") [Var (Just (6,23)-(6,24)) "b"])] (Tuple (Just (6,28)-(6,46)) [Var (Just (6,29)-(6,31)) "b'",Bop (Just (6,33)-(6,45)) Neq (App (Just (6,34)-(6,39)) (Var (Just (6,35)-(6,36)) "f") [Var (Just (6,37)-(6,38)) "b"]) (Var (Just (6,43)-(6,44)) "b")])) Nothing)] (App (Just (6,50)-(6,63)) (Var (Just (6,50)-(6,56)) "wwhile") [Tuple (Just (6,57)-(6,63)) [Var (Just (6,58)-(6,59)) "f",Var (Just (6,61)-(6,62)) "b"]])
*)

(* typed spans
(6,2)-(6,63)
*)

(* correct types
'a
*)

(* bad types
'a
*)
