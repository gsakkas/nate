
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (fun input  -> let b = f input in ((b, (b != input)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((fun input  -> let b = f input in (b, (b != input))), b);;

*)

(* changed spans
(6,9)-(6,66)
(fun input ->
   (let b = f input in
    (b , b <> input)) , b)
TupleG (fromList [VarG,LamG EmptyG])

*)

(* changed exprs
Tuple (Just (6,9)-(6,66)) [Lam (Just (6,10)-(6,62)) (VarPat (Just (6,15)-(6,20)) "input") (Let (Just (6,25)-(6,61)) NonRec [(VarPat (Just (6,29)-(6,30)) "b",App (Just (6,33)-(6,40)) (Var (Just (6,33)-(6,34)) "f") [Var (Just (6,35)-(6,40)) "input"])] (Tuple (Just (6,44)-(6,61)) [Var (Just (6,45)-(6,46)) "b",Bop (Just (6,48)-(6,60)) Neq (Var (Just (6,49)-(6,50)) "b") (Var (Just (6,54)-(6,59)) "input")])) Nothing,Var (Just (6,64)-(6,65)) "b"]
*)

(* typed spans
(6,9)-(6,66)
*)

(* correct types
('a -> ('a * bool) * 'a)
*)

(* bad types
'a -> (('a * bool) * 'a)
*)
