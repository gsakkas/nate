
let rec wwhile (f,b) =
  let (x,y) = f b in if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  wwhile ((if (f b) = b then (b, false) else ((f b), true)), b);;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) =
  wwhile (let g b = ((f b), (if (f b) = b then false else true)) in (g, b));;

*)

(* changed spans
(3,24)-(3,33)
y
VarG

(3,57)-(3,58)
x
VarG

(6,2)-(6,8)
let g =
  fun b ->
    (f b , if f b = b
           then false
           else true) in
(g , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(6,9)-(6,63)
f b
AppG (fromList [VarG])

(6,29)-(6,39)
false
LitG

(6,45)-(6,58)
true
LitG

(6,45)-(6,58)
(g , b)
TupleG (fromList [VarG])

*)

(* changed exprs
Var (Just (2,45)-(2,46)) "y"
Var (Just (2,71)-(2,72)) "x"
Let (Just (5,9)-(5,75)) NonRec [(VarPat (Just (5,14)-(5,15)) "g",Lam (Just (5,16)-(5,64)) (VarPat (Just (5,16)-(5,17)) "b") (Tuple (Just (5,20)-(5,64)) [App (Just (5,21)-(5,26)) (Var (Just (5,22)-(5,23)) "f") [Var (Just (5,24)-(5,25)) "b"],Ite (Just (5,28)-(5,63)) (Bop (Just (5,32)-(5,41)) Eq (App (Just (5,32)-(5,37)) (Var (Just (5,33)-(5,34)) "f") [Var (Just (5,35)-(5,36)) "b"]) (Var (Just (5,40)-(5,41)) "b")) (Lit (Just (5,47)-(5,52)) (LB False)) (Lit (Just (5,58)-(5,62)) (LB True))]) Nothing)] (Tuple (Just (5,68)-(5,74)) [Var (Just (5,69)-(5,70)) "g",Var (Just (5,72)-(5,73)) "b"])
App (Just (5,21)-(5,26)) (Var (Just (5,22)-(5,23)) "f") [Var (Just (5,24)-(5,25)) "b"]
Lit (Just (5,47)-(5,52)) (LB False)
Lit (Just (5,58)-(5,62)) (LB True)
Tuple (Just (5,68)-(5,74)) [Var (Just (5,69)-(5,70)) "g",Var (Just (5,72)-(5,73)) "b"]
*)

(* typed spans
(2,45)-(2,46)
(2,71)-(2,72)
(5,9)-(5,75)
(5,21)-(5,26)
(5,47)-(5,52)
(5,58)-(5,62)
(5,68)-(5,74)
*)

(* correct types
bool
'a
('a -> ('a * bool) * 'a)
'a
bool
bool
('a -> ('a * bool) * 'a)
*)

(* bad types
bool
'a
('a -> ('a * bool) * 'a) -> 'a
(('a * bool) * 'a)
('a * bool)
('a * bool)
('a * bool)
*)
