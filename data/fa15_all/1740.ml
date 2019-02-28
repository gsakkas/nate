
let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) =
  wwhile (let f' (f,b) = ((f b), (b == (f b))) in ((f' (f, b)), b));;


(* fix

let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let f' b = ((f b), (b = (f b))) in f'), b);;

*)

(* changed spans
(6,9)-(6,67)
(let f' =
   fun b -> (f b , b = f b) in
 f' , b)
TupleG (fromList [VarG,LetG NonRec (fromList [EmptyG]) EmptyG])

*)

(* changed exprs
Tuple (Just (5,28)-(5,72)) [Let (Just (5,29)-(5,68)) NonRec [(VarPat (Just (5,34)-(5,36)) "f'",Lam (Just (5,37)-(5,61)) (VarPat (Just (5,37)-(5,38)) "b") (Tuple (Just (5,41)-(5,61)) [App (Just (5,42)-(5,47)) (Var (Just (5,43)-(5,44)) "f") [Var (Just (5,45)-(5,46)) "b"],Bop (Just (5,49)-(5,60)) Eq (Var (Just (5,50)-(5,51)) "b") (App (Just (5,54)-(5,59)) (Var (Just (5,55)-(5,56)) "f") [Var (Just (5,57)-(5,58)) "b"])]) Nothing)] (Var (Just (5,65)-(5,67)) "f'"),Var (Just (5,70)-(5,71)) "b"]
*)

(* typed spans
(5,28)-(5,72)
*)

(* correct types
('a -> ('a * bool) * 'a)
*)

(* bad types
(('a * bool) * 'a)
*)
