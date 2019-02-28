
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) =
  if b != (f b) then let f = (f, true) in wwhile (f, (f b)) else b;;


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

(8,21)-(8,59)
f b
AppG (fromList [VarG])

(8,29)-(8,38)
let g =
  fun b -> (f b , true) in
wwhile (g , f b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(8,30)-(8,31)
f b
AppG (fromList [VarG])

(8,33)-(8,37)
b
VarG

(8,50)-(8,51)
g
VarG

*)

(* changed exprs
Bop (Just (8,5)-(8,14)) Eq (Var (Just (8,5)-(8,6)) "b") (App (Just (8,9)-(8,14)) (Var (Just (8,10)-(8,11)) "f") [Var (Just (8,12)-(8,13)) "b"])
App (Just (8,20)-(8,23)) (Var (Just (8,20)-(8,21)) "f") [Var (Just (8,22)-(8,23)) "b"]
Let (Just (8,29)-(8,75)) NonRec [(VarPat (Just (8,34)-(8,35)) "g",Lam (Just (8,36)-(8,53)) (VarPat (Just (8,36)-(8,37)) "b") (Tuple (Just (8,40)-(8,53)) [App (Just (8,41)-(8,46)) (Var (Just (8,42)-(8,43)) "f") [Var (Just (8,44)-(8,45)) "b"],Lit (Just (8,48)-(8,52)) (LB True)]) Nothing)] (App (Just (8,57)-(8,74)) (Var (Just (8,57)-(8,63)) "wwhile") [Tuple (Just (8,64)-(8,74)) [Var (Just (8,65)-(8,66)) "g",App (Just (8,68)-(8,73)) (Var (Just (8,69)-(8,70)) "f") [Var (Just (8,71)-(8,72)) "b"]]])
App (Just (8,41)-(8,46)) (Var (Just (8,42)-(8,43)) "f") [Var (Just (8,44)-(8,45)) "b"]
Var (Just (8,44)-(8,45)) "b"
Var (Just (8,65)-(8,66)) "g"
*)

(* typed spans
(8,5)-(8,14)
(8,20)-(8,23)
(8,29)-(8,75)
(8,41)-(8,46)
(8,44)-(8,45)
(8,65)-(8,66)
*)

(* correct types
bool
'a
'a
'a
'a
'a -> ('a * bool)
*)

(* bad types
bool
'a
('a -> 'a * bool)
'a -> 'a
bool
('a -> 'a * bool)
*)
