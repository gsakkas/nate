
let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (x,true ) -> wwhile (f, x);;

let fixpoint (f,b) = wwhile (((f b), (b = (f b))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (x,true ) -> wwhile (f, x);;

let fixpoint (f,b) =
  wwhile (let g x = let bb = f b in (bb, (bb = b)) in (g, b));;

*)

(* changed spans
(5,28)-(5,53)
let g =
  fun x ->
    (let bb = f b in
     (bb , bb = b)) in
(g , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (6,9)-(6,61)) NonRec [(VarPat (Just (6,14)-(6,15)) "g",Lam (Just (6,16)-(6,50)) (VarPat (Just (6,16)-(6,17)) "x") (Let (Just (6,20)-(6,50)) NonRec [(VarPat (Just (6,24)-(6,26)) "bb",App (Just (6,29)-(6,32)) (Var (Just (6,29)-(6,30)) "f") [Var (Just (6,31)-(6,32)) "b"])] (Tuple (Just (6,36)-(6,50)) [Var (Just (6,37)-(6,39)) "bb",Bop (Just (6,41)-(6,49)) Eq (Var (Just (6,42)-(6,44)) "bb") (Var (Just (6,47)-(6,48)) "b")])) Nothing)] (Tuple (Just (6,54)-(6,60)) [Var (Just (6,55)-(6,56)) "g",Var (Just (6,58)-(6,59)) "b"])
*)

(* typed spans
(6,9)-(6,61)
*)

(* correct types
('a -> ('a * bool) * 'a)
*)

(* bad types
(('a * bool) * 'a)
*)
