
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (fun b  -> (((f b), ((f b) != b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun b  -> ((f b), ((f b) != b))), b);;

*)

(* changed spans
(5,28)-(5,66)
(fun b ->
   (f b , f b <> b) , b)
TupleG (fromList [VarG,LamG EmptyG])

*)

(* changed exprs
Tuple (Just (5,28)-(5,66)) [Lam (Just (5,29)-(5,62)) (VarPat (Just (5,34)-(5,35)) "b") (Tuple (Just (5,40)-(5,61)) [App (Just (5,41)-(5,46)) (Var (Just (5,42)-(5,43)) "f") [Var (Just (5,44)-(5,45)) "b"],Bop (Just (5,48)-(5,60)) Neq (App (Just (5,49)-(5,54)) (Var (Just (5,50)-(5,51)) "f") [Var (Just (5,52)-(5,53)) "b"]) (Var (Just (5,58)-(5,59)) "b")]) Nothing,Var (Just (5,64)-(5,65)) "b"]
*)

(* typed spans
(5,28)-(5,66)
*)

(* correct types
('a -> ('a * bool) * 'a)
*)

(* bad types
'a -> (('a * bool) * 'a)
*)
