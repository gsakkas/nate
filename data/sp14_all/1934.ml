
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) =
  if b != (f b)
  then let f b = (b, true) in wwhile (f, (f b))
  else wwhile (f b);;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) =
  if b = (f b) then f b else (let g b = ((f b), true) in wwhile (g, (f b)));;

*)

(* changed spans
(8,5)-(8,15)
b = f b
BopG VarG (AppG (fromList [EmptyG]))

(9,7)-(9,47)
f b
AppG (fromList [VarG])

(9,7)-(9,47)
f
VarG

(9,7)-(9,47)
b
VarG

(9,41)-(9,46)
let g =
  fun b -> (f b , true) in
wwhile (g , f b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(10,7)-(10,19)
true
LitG

(10,14)-(10,19)
(g , f b)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
Bop (Just (8,5)-(8,14)) Eq (Var (Just (8,5)-(8,6)) "b") (App (Just (8,9)-(8,14)) (Var (Just (8,10)-(8,11)) "f") [Var (Just (8,12)-(8,13)) "b"])
App (Just (8,20)-(8,23)) (Var (Just (8,20)-(8,21)) "f") [Var (Just (8,22)-(8,23)) "b"]
Var (Just (8,20)-(8,21)) "f"
Var (Just (8,22)-(8,23)) "b"
Let (Just (8,29)-(8,75)) NonRec [(VarPat (Just (8,34)-(8,35)) "g",Lam (Just (8,36)-(8,53)) (VarPat (Just (8,36)-(8,37)) "b") (Tuple (Just (8,40)-(8,53)) [App (Just (8,41)-(8,46)) (Var (Just (8,42)-(8,43)) "f") [Var (Just (8,44)-(8,45)) "b"],Lit (Just (8,48)-(8,52)) (LB True)]) Nothing)] (App (Just (8,57)-(8,74)) (Var (Just (8,57)-(8,63)) "wwhile") [Tuple (Just (8,64)-(8,74)) [Var (Just (8,65)-(8,66)) "g",App (Just (8,68)-(8,73)) (Var (Just (8,69)-(8,70)) "f") [Var (Just (8,71)-(8,72)) "b"]]])
Lit (Just (8,48)-(8,52)) (LB True)
Tuple (Just (8,64)-(8,74)) [Var (Just (8,65)-(8,66)) "g",App (Just (8,68)-(8,73)) (Var (Just (8,69)-(8,70)) "f") [Var (Just (8,71)-(8,72)) "b"]]
*)

(* typed spans
(8,5)-(8,14)
(8,20)-(8,23)
(8,20)-(8,21)
(8,22)-(8,23)
(8,29)-(8,75)
(8,48)-(8,52)
(8,64)-(8,74)
*)

(* correct types
bool
'a
'a -> 'a
'a
'a
bool
('a -> ('a * bool) * 'a)
*)

(* bad types
bool
'a
'a
'a
('a * bool)
'a
'a
*)
