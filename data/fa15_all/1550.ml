
let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile ((let f' b = let b' = f b in (b', (b' = b)) in f' 1), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile ((let f' x = let b' = f b in (b', (b' = b)) in f'), b);;

*)

(* changed spans
(6,18)-(6,52)
fun x ->
  (let b' = f b in
   (b' , b' = b))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(6,56)-(6,60)
f'
VarG

*)

(* changed exprs
Lam (Just (6,18)-(6,52)) (VarPat (Just (6,18)-(6,19)) "x") (Let (Just (6,22)-(6,52)) NonRec [(VarPat (Just (6,26)-(6,28)) "b'",App (Just (6,31)-(6,34)) (Var (Just (6,31)-(6,32)) "f") [Var (Just (6,33)-(6,34)) "b"])] (Tuple (Just (6,38)-(6,52)) [Var (Just (6,39)-(6,41)) "b'",Bop (Just (6,43)-(6,51)) Eq (Var (Just (6,44)-(6,46)) "b'") (Var (Just (6,49)-(6,50)) "b")])) Nothing
Var (Just (6,56)-(6,58)) "f'"
*)

(* typed spans
(6,18)-(6,52)
(6,56)-(6,58)
*)

(* correct types
'a -> ('a * bool)
'a -> ('a * bool)
*)

(* bad types
int -> (int * bool)
(int * bool)
*)
