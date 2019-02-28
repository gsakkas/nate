
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((let b' = f b in if b != b' then true else false), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = let f' b' = ((f b'), ((f b') != b')) in wwhile (f', b);;

*)

(* changed spans
(6,2)-(6,63)
let f' =
  fun b' ->
    (f b' , f b' <> b') in
wwhile (f' , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (5,21)-(5,75)) NonRec [(VarPat (Just (5,25)-(5,27)) "f'",Lam (Just (5,28)-(5,57)) (VarPat (Just (5,28)-(5,30)) "b'") (Tuple (Just (5,33)-(5,57)) [App (Just (5,34)-(5,40)) (Var (Just (5,35)-(5,36)) "f") [Var (Just (5,37)-(5,39)) "b'"],Bop (Just (5,42)-(5,56)) Neq (App (Just (5,43)-(5,49)) (Var (Just (5,44)-(5,45)) "f") [Var (Just (5,46)-(5,48)) "b'"]) (Var (Just (5,53)-(5,55)) "b'")]) Nothing)] (App (Just (5,61)-(5,75)) (Var (Just (5,61)-(5,67)) "wwhile") [Tuple (Just (5,68)-(5,75)) [Var (Just (5,69)-(5,71)) "f'",Var (Just (5,73)-(5,74)) "b"]])
*)

(* typed spans
(5,21)-(5,75)
*)

(* correct types
'a
*)

(* bad types
'a
*)
