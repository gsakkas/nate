
let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile (fun x  -> (((f b), ((f b) = b)), b));;


(* fix

let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile ((fun b  -> ((f b), ((f b) = b))), b);;

*)

(* changed spans
(6,28)-(6,65)
(fun b -> (f b , f b = b) , b)
TupleG (fromList [VarG,LamG EmptyG])

*)

(* changed exprs
Tuple (Just (6,28)-(6,65)) [Lam (Just (6,29)-(6,61)) (VarPat (Just (6,34)-(6,35)) "b") (Tuple (Just (6,40)-(6,60)) [App (Just (6,41)-(6,46)) (Var (Just (6,42)-(6,43)) "f") [Var (Just (6,44)-(6,45)) "b"],Bop (Just (6,48)-(6,59)) Eq (App (Just (6,49)-(6,54)) (Var (Just (6,50)-(6,51)) "f") [Var (Just (6,52)-(6,53)) "b"]) (Var (Just (6,57)-(6,58)) "b")]) Nothing,Var (Just (6,63)-(6,64)) "b"]
*)

(* typed spans
(6,28)-(6,65)
*)

(* correct types
('a -> ('a * bool) * 'a)
*)

(* bad types
'a -> (('b * bool) * 'b)
*)
