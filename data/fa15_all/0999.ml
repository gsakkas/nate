
let helper (f,b) = let x = f b in (x, (x != b));;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;


(* fix

let helper (f,b) = let f b = let x = f b in (x, (x != b)) in f;;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;

*)

(* changed spans
(2,19)-(2,47)
let f =
  fun b ->
    (let x = f b in
     (x , x <> b)) in
f
LetG NonRec (fromList [LamG EmptyG]) VarG

*)

(* changed exprs
Let (Just (2,19)-(2,62)) NonRec [(VarPat (Just (2,23)-(2,24)) "f",Lam (Just (2,25)-(2,57)) (VarPat (Just (2,25)-(2,26)) "b") (Let (Just (2,29)-(2,57)) NonRec [(VarPat (Just (2,33)-(2,34)) "x",App (Just (2,37)-(2,40)) (Var (Just (2,37)-(2,38)) "f") [Var (Just (2,39)-(2,40)) "b"])] (Tuple (Just (2,44)-(2,57)) [Var (Just (2,45)-(2,46)) "x",Bop (Just (2,48)-(2,56)) Neq (Var (Just (2,49)-(2,50)) "x") (Var (Just (2,54)-(2,55)) "b")])) Nothing)] (Var (Just (2,61)-(2,62)) "f")
*)

(* typed spans
(2,19)-(2,62)
*)

(* correct types
'a -> ('a * bool)
*)

(* bad types
('a * bool)
*)
