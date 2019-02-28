
let rec wwhile (f,b) =
  let (value,result) = f b in if not result then value else wwhile (f, value);;

let fixpoint (f,b) =
  wwhile ((let func output = ((f output), ((f output) = b)) in func b), b);;


(* fix

let rec wwhile (f,b) =
  let (value,result) = f b in if not result then value else wwhile (f, value);;

let fixpoint (f,b) =
  wwhile ((let func input = ((f input), ((f input) = b)) in func), b);;

*)

(* changed spans
(6,20)-(6,59)
fun input ->
  (f input , f input = b)
LamG (TupleG (fromList [EmptyG]))

(6,63)-(6,69)
func
VarG

(6,63)-(6,69)
b
VarG

*)

(* changed exprs
Lam (Just (6,20)-(6,56)) (VarPat (Just (6,20)-(6,25)) "input") (Tuple (Just (6,28)-(6,56)) [App (Just (6,29)-(6,38)) (Var (Just (6,30)-(6,31)) "f") [Var (Just (6,32)-(6,37)) "input"],Bop (Just (6,40)-(6,55)) Eq (App (Just (6,41)-(6,50)) (Var (Just (6,42)-(6,43)) "f") [Var (Just (6,44)-(6,49)) "input"]) (Var (Just (6,53)-(6,54)) "b")]) Nothing
Var (Just (6,60)-(6,64)) "func"
Var (Just (6,67)-(6,68)) "b"
*)

(* typed spans
(6,20)-(6,56)
(6,60)-(6,64)
(6,67)-(6,68)
*)

(* correct types
'a -> ('a * bool)
'a -> ('a * bool)
'a
*)

(* bad types
'a -> ('a * bool)
('a * bool)
('a * bool)
*)
