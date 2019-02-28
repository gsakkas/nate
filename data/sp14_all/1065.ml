
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let fx = ((f b), ((f b) = b)) in wwhile (fx, b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let fx b = ((f b), ((f b) = b)) in wwhile (fx, b);;

*)

(* changed spans
(4,30)-(4,50)
fun b -> (f b , f b = b)
LamG (TupleG (fromList [EmptyG]))

*)

(* changed exprs
Lam (Just (4,28)-(4,52)) (VarPat (Just (4,28)-(4,29)) "b") (Tuple (Just (4,32)-(4,52)) [App (Just (4,33)-(4,38)) (Var (Just (4,34)-(4,35)) "f") [Var (Just (4,36)-(4,37)) "b"],Bop (Just (4,40)-(4,51)) Eq (App (Just (4,41)-(4,46)) (Var (Just (4,42)-(4,43)) "f") [Var (Just (4,44)-(4,45)) "b"]) (Var (Just (4,49)-(4,50)) "b")]) Nothing
*)

(* typed spans
(4,28)-(4,52)
*)

(* correct types
'a -> ('a * bool)
*)

(* bad types
('a * bool)
*)
