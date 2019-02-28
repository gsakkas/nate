
let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) = wwhile (let n z = (f, (b = (f b))) in (n, b));;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f b in (ff, (b = ff)) in (n, b));;

*)

(* changed spans
(6,35)-(6,55)
fun x ->
  (let ff = f b in
   (ff , b = ff))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(6,60)-(6,61)
(n , b)
TupleG (fromList [VarG])

*)

(* changed exprs
Lam (Just (7,16)-(7,50)) (VarPat (Just (7,16)-(7,17)) "x") (Let (Just (7,20)-(7,50)) NonRec [(VarPat (Just (7,24)-(7,26)) "ff",App (Just (7,29)-(7,32)) (Var (Just (7,29)-(7,30)) "f") [Var (Just (7,31)-(7,32)) "b"])] (Tuple (Just (7,36)-(7,50)) [Var (Just (7,37)-(7,39)) "ff",Bop (Just (7,41)-(7,49)) Eq (Var (Just (7,42)-(7,43)) "b") (Var (Just (7,46)-(7,48)) "ff")])) Nothing
Tuple (Just (7,54)-(7,60)) [Var (Just (7,55)-(7,56)) "n",Var (Just (7,58)-(7,59)) "b"]
*)

(* typed spans
(7,16)-(7,50)
(7,54)-(7,60)
*)

(* correct types
'a -> ('a * bool)
('a -> ('a * bool) * 'a)
*)

(* bad types
('a -> 'a) -> ('a -> 'a * bool)
('a -> 'a) -> ('a -> 'a * bool)
*)
