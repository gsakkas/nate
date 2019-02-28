
let g (f,x) = let xx = f x in (xx, (xx = (f x)));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (g, b);;


(* fix

let g h x = let xx = h x in (xx, (xx = (h x)));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((g f), b);;

*)

(* changed spans
(2,7)-(2,48)
fun h ->
  fun x ->
    (let xx = h x in
     (xx , xx = h x))
LamG (LamG EmptyG)

(6,29)-(6,30)
g f
AppG (fromList [VarG])

(6,32)-(6,33)
f
VarG

*)

(* changed exprs
Lam (Just (2,6)-(2,46)) (VarPat (Just (2,6)-(2,7)) "h") (Lam (Just (2,8)-(2,46)) (VarPat (Just (2,8)-(2,9)) "x") (Let (Just (2,12)-(2,46)) NonRec [(VarPat (Just (2,16)-(2,18)) "xx",App (Just (2,21)-(2,24)) (Var (Just (2,21)-(2,22)) "h") [Var (Just (2,23)-(2,24)) "x"])] (Tuple (Just (2,28)-(2,46)) [Var (Just (2,29)-(2,31)) "xx",Bop (Just (2,33)-(2,45)) Eq (Var (Just (2,34)-(2,36)) "xx") (App (Just (2,39)-(2,44)) (Var (Just (2,40)-(2,41)) "h") [Var (Just (2,42)-(2,43)) "x"])])) Nothing) Nothing
App (Just (6,29)-(6,34)) (Var (Just (6,30)-(6,31)) "g") [Var (Just (6,32)-(6,33)) "f"]
Var (Just (6,32)-(6,33)) "f"
*)

(* typed spans
(2,6)-(2,46)
(6,29)-(6,34)
(6,32)-(6,33)
*)

(* correct types
('a -> 'a) -> 'a -> ('a * bool)
'a -> ('a * bool)
'a -> 'a
*)

(* bad types
('a -> 'b * 'a) -> ('b * bool)
('a -> 'b * 'a) -> ('b * bool)
'a
*)
