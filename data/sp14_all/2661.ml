
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let b' = f b in ((b' = b), b));;


(* fix

let h x = let xx = (x * x) * x in (xx, (xx < 512));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(2,16)-(2,77)
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 512))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(4,28)-(4,59)
(h , b)
TupleG (fromList [VarG])

(4,28)-(4,59)
h
VarG

*)

(* changed exprs
Lam (Just (2,6)-(2,50)) (VarPat (Just (2,6)-(2,7)) "x") (Let (Just (2,10)-(2,50)) NonRec [(VarPat (Just (2,14)-(2,16)) "xx",Bop (Just (2,19)-(2,30)) Times (Bop (Just (2,19)-(2,26)) Times (Var (Just (2,20)-(2,21)) "x") (Var (Just (2,24)-(2,25)) "x")) (Var (Just (2,29)-(2,30)) "x"))] (Tuple (Just (2,34)-(2,50)) [Var (Just (2,35)-(2,37)) "xx",Bop (Just (2,39)-(2,49)) Lt (Var (Just (2,40)-(2,42)) "xx") (Lit (Just (2,45)-(2,48)) (LI 512))])) Nothing
Tuple (Just (6,28)-(6,34)) [Var (Just (6,29)-(6,30)) "h",Var (Just (6,32)-(6,33)) "b"]
Var (Just (6,29)-(6,30)) "h"
*)

(* typed spans
(2,6)-(2,50)
(6,28)-(6,34)
(6,29)-(6,30)
*)

(* correct types
int -> (int * bool)
(int -> (int * bool) * int)
int -> (int * bool)
*)

(* bad types
('a -> ('a * bool) * 'a) -> 'a
(bool * 'a)
(bool * 'a)
*)
