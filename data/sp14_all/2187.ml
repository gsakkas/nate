
let rec wwhile (f,b) =
  let check = f b in
  match check with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) = wwhile (fun x  -> let b = f x in ((b, (b != x)), b));;


(* fix

let rec wwhile (f,b) =
  let check = f b in
  match check with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) = wwhile ((fun x  -> let b = f x in (b, (b != x))), b);;

*)

(* changed spans
(6,28)-(6,73)
(fun x ->
   (let b = f x in
    (b , b <> x)) , b)
TupleG (fromList [VarG,LamG EmptyG])

*)

(* changed exprs
Tuple (Just (6,28)-(6,73)) [Lam (Just (6,29)-(6,69)) (VarPat (Just (6,34)-(6,35)) "x") (Let (Just (6,40)-(6,68)) NonRec [(VarPat (Just (6,44)-(6,45)) "b",App (Just (6,48)-(6,51)) (Var (Just (6,48)-(6,49)) "f") [Var (Just (6,50)-(6,51)) "x"])] (Tuple (Just (6,55)-(6,68)) [Var (Just (6,56)-(6,57)) "b",Bop (Just (6,59)-(6,67)) Neq (Var (Just (6,60)-(6,61)) "b") (Var (Just (6,65)-(6,66)) "x")])) Nothing,Var (Just (6,71)-(6,72)) "b"]
*)

(* typed spans
(6,28)-(6,73)
*)

(* correct types
('a -> ('a * bool) * 'a)
*)

(* bad types
'a -> (('a * bool) * 'a)
*)
