
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((((f b) = b), (f b)), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let fx b' = ((f b'), ((f b') = b')) in wwhile (fx, b);;

*)

(* changed spans
(4,21)-(4,53)
let fx =
  fun b' ->
    (f b' , f b' = b') in
wwhile (fx , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (4,21)-(4,74)) NonRec [(VarPat (Just (4,25)-(4,27)) "fx",Lam (Just (4,28)-(4,56)) (VarPat (Just (4,28)-(4,30)) "b'") (Tuple (Just (4,33)-(4,56)) [App (Just (4,34)-(4,40)) (Var (Just (4,35)-(4,36)) "f") [Var (Just (4,37)-(4,39)) "b'"],Bop (Just (4,42)-(4,55)) Eq (App (Just (4,43)-(4,49)) (Var (Just (4,44)-(4,45)) "f") [Var (Just (4,46)-(4,48)) "b'"]) (Var (Just (4,52)-(4,54)) "b'")]) Nothing)] (App (Just (4,60)-(4,74)) (Var (Just (4,60)-(4,66)) "wwhile") [Tuple (Just (4,67)-(4,74)) [Var (Just (4,68)-(4,70)) "fx",Var (Just (4,72)-(4,73)) "b"]])
*)

(* typed spans
(4,21)-(4,74)
*)

(* correct types
'a
*)

(* bad types
'a
*)
