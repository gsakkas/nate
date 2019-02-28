
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | true  -> wwhile (f, b') | false  -> b';;

let fixpoint (f,b) = wwhile ((let func (x,y) = (f x) = y in func), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | true  -> wwhile (f, b') | false  -> b';;

let fixpoint (f,b) = wwhile ((fun b'  -> let x = f b' in (x, (b' != x))), b);;

*)

(* changed spans
(5,29)-(5,65)
fun b' ->
  (let x = f b' in
   (x , b' <> x))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Lam (Just (5,29)-(5,72)) (VarPat (Just (5,34)-(5,36)) "b'") (Let (Just (5,41)-(5,71)) NonRec [(VarPat (Just (5,45)-(5,46)) "x",App (Just (5,49)-(5,53)) (Var (Just (5,49)-(5,50)) "f") [Var (Just (5,51)-(5,53)) "b'"])] (Tuple (Just (5,57)-(5,71)) [Var (Just (5,58)-(5,59)) "x",Bop (Just (5,61)-(5,70)) Neq (Var (Just (5,62)-(5,64)) "b'") (Var (Just (5,68)-(5,69)) "x")])) Nothing
*)

(* typed spans
(5,29)-(5,72)
*)

(* correct types
'a -> ('a * bool)
*)

(* bad types
('a * 'b) -> bool
*)
