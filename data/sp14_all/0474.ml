
let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (x,true ) -> wwhile (f, x);;

let fixpoint (f,b) =
  wwhile (let g = let bb = f b in (bb, (bb = b)) in (g, b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (x,true ) -> wwhile (f, x);;

let fixpoint (f,b) =
  wwhile (let g x = let bb = f x in (bb, (bb = x)) in (g, b));;

*)

(* changed spans
(6,18)-(6,48)
fun x ->
  (let bb = f x in
   (bb , bb = x))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Lam (Just (6,16)-(6,50)) (VarPat (Just (6,16)-(6,17)) "x") (Let (Just (6,20)-(6,50)) NonRec [(VarPat (Just (6,24)-(6,26)) "bb",App (Just (6,29)-(6,32)) (Var (Just (6,29)-(6,30)) "f") [Var (Just (6,31)-(6,32)) "x"])] (Tuple (Just (6,36)-(6,50)) [Var (Just (6,37)-(6,39)) "bb",Bop (Just (6,41)-(6,49)) Eq (Var (Just (6,42)-(6,44)) "bb") (Var (Just (6,47)-(6,48)) "x")])) Nothing
*)

(* typed spans
(6,16)-(6,50)
*)

(* correct types
'a -> ('a * bool)
*)

(* bad types
('a * bool)
*)
