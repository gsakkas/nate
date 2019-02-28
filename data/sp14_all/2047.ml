
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let b' = (b, ((f b) = b)) in wwhile (f, b');;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let f b = ((f b), (b = (f b))) in wwhile (f, b);;

*)

(* changed spans
(4,21)-(4,64)
let f =
  fun b -> (f b , b = f b) in
wwhile (f , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (4,21)-(4,68)) NonRec [(VarPat (Just (4,25)-(4,26)) "f",Lam (Just (4,27)-(4,51)) (VarPat (Just (4,27)-(4,28)) "b") (Tuple (Just (4,31)-(4,51)) [App (Just (4,32)-(4,37)) (Var (Just (4,33)-(4,34)) "f") [Var (Just (4,35)-(4,36)) "b"],Bop (Just (4,39)-(4,50)) Eq (Var (Just (4,40)-(4,41)) "b") (App (Just (4,44)-(4,49)) (Var (Just (4,45)-(4,46)) "f") [Var (Just (4,47)-(4,48)) "b"])]) Nothing)] (App (Just (4,55)-(4,68)) (Var (Just (4,55)-(4,61)) "wwhile") [Tuple (Just (4,62)-(4,68)) [Var (Just (4,63)-(4,64)) "f",Var (Just (4,66)-(4,67)) "b"]])
*)

(* typed spans
(4,21)-(4,68)
*)

(* correct types
'a
*)

(* bad types
'a
*)
