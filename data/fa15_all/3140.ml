
let rec wwhile (f,b) =
  match f b with | (b',c) -> if c = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (fun x  -> let b = f x in ((b, (b != x)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c) -> if c = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> let b = f x in (b, (b != x))), b);;

*)

(* changed spans
(5,28)-(5,73)
(fun x ->
   (let b = f x in
    (b , b <> x)) , b)
TupleG (fromList [VarG,LamG EmptyG])

*)

(* changed exprs
Tuple (Just (5,28)-(5,73)) [Lam (Just (5,29)-(5,69)) (VarPat (Just (5,34)-(5,35)) "x") (Let (Just (5,40)-(5,68)) NonRec [(VarPat (Just (5,44)-(5,45)) "b",App (Just (5,48)-(5,51)) (Var (Just (5,48)-(5,49)) "f") [Var (Just (5,50)-(5,51)) "x"])] (Tuple (Just (5,55)-(5,68)) [Var (Just (5,56)-(5,57)) "b",Bop (Just (5,59)-(5,67)) Neq (Var (Just (5,60)-(5,61)) "b") (Var (Just (5,65)-(5,66)) "x")])) Nothing,Var (Just (5,71)-(5,72)) "b"]
*)

(* typed spans
(5,28)-(5,73)
*)

(* correct types
('a -> ('a * bool) * 'a)
*)

(* bad types
'a -> (('a * bool) * 'a)
*)
