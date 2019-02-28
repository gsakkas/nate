
let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile (fun b  -> ((f b), ((f b) != b), b));;


(* fix

let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile ((fun b  -> ((f b), (b != (f b)))), b);;

*)

(* changed spans
(6,28)-(6,64)
(fun b ->
   (f b , b <> f b) , b)
TupleG (fromList [VarG,LamG EmptyG])

*)

(* changed exprs
Tuple (Just (6,28)-(6,66)) [Lam (Just (6,29)-(6,62)) (VarPat (Just (6,34)-(6,35)) "b") (Tuple (Just (6,40)-(6,61)) [App (Just (6,41)-(6,46)) (Var (Just (6,42)-(6,43)) "f") [Var (Just (6,44)-(6,45)) "b"],Bop (Just (6,48)-(6,60)) Neq (Var (Just (6,49)-(6,50)) "b") (App (Just (6,54)-(6,59)) (Var (Just (6,55)-(6,56)) "f") [Var (Just (6,57)-(6,58)) "b"])]) Nothing,Var (Just (6,64)-(6,65)) "b"]
*)

(* typed spans
(6,28)-(6,66)
*)

(* correct types
('a -> ('a * bool) * 'a)
*)

(* bad types
'a -> ('a * bool * 'a)
*)
