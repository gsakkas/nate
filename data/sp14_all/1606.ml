
let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) =
  wwhile ((let (x,y) = f b in (x, ((x <> b) && ((x, y) <> (f (b - 1)))))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) =
  wwhile ((let a x = let xx = f x in (xx, (x <> b)) in a), b);;

*)

(* changed spans
(6,10)-(6,73)
let a =
  fun x ->
    (let xx = f x in
     (xx , x <> b)) in
a
LetG NonRec (fromList [LamG EmptyG]) VarG

*)

(* changed exprs
Let (Just (6,10)-(6,57)) NonRec [(VarPat (Just (6,15)-(6,16)) "a",Lam (Just (6,17)-(6,51)) (VarPat (Just (6,17)-(6,18)) "x") (Let (Just (6,21)-(6,51)) NonRec [(VarPat (Just (6,25)-(6,27)) "xx",App (Just (6,30)-(6,33)) (Var (Just (6,30)-(6,31)) "f") [Var (Just (6,32)-(6,33)) "x"])] (Tuple (Just (6,37)-(6,51)) [Var (Just (6,38)-(6,40)) "xx",Bop (Just (6,42)-(6,50)) Neq (Var (Just (6,43)-(6,44)) "x") (Var (Just (6,48)-(6,49)) "b")])) Nothing)] (Var (Just (6,55)-(6,56)) "a")
*)

(* typed spans
(6,10)-(6,57)
*)

(* correct types
'a -> ('a * bool)
*)

(* bad types
(int * bool)
*)
