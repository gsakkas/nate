
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if (f b) = b then (b, b) else (b, b) in wwhile ((funt b), b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let funt x = (2, ((f b) = b)) in wwhile (funt, b);;

*)

(* changed spans
(7,11)-(7,51)
fun x -> (2 , f b = b)
LamG (TupleG (fromList [EmptyG]))

(7,63)-(7,71)
wwhile (funt , b)
AppG (fromList [TupleG (fromList [EmptyG])])

(7,63)-(7,71)
wwhile
VarG

(7,73)-(7,74)
EMPTY
EmptyG

*)

(* changed exprs
Lam (Just (6,30)-(6,50)) (VarPat (Just (6,30)-(6,31)) "x") (Tuple (Just (6,34)-(6,50)) [Lit (Just (6,35)-(6,36)) (LI 2),Bop (Just (6,38)-(6,49)) Eq (App (Just (6,39)-(6,44)) (Var (Just (6,40)-(6,41)) "f") [Var (Just (6,42)-(6,43)) "b"]) (Var (Just (6,47)-(6,48)) "b")]) Nothing
App (Just (6,54)-(6,70)) (Var (Just (6,54)-(6,60)) "wwhile") [Tuple (Just (6,61)-(6,70)) [Var (Just (6,62)-(6,66)) "funt",Var (Just (6,68)-(6,69)) "b"]]
Var (Just (6,54)-(6,60)) "wwhile"
Var (Just (7,73)-(7,74)) "EMPTY"
*)

(* typed spans
(6,30)-(6,50)
(6,54)-(6,70)
(6,54)-(6,60)
*)

(* correct types
int -> (int * bool)
int
(int -> (int * bool) * int) -> int
*)

(* bad types
'a -> ('a * 'a)
('a * 'a)
('a * 'a)
*)
