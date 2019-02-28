
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((let g b = (f, ((f b) = b)) in g), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (let g x = let calcfx = f x in (calcfx, (calcfx = x)) in (g, b));;

*)

(* changed spans
(4,28)-(4,66)
let g =
  fun x ->
    (let calcfx = f x in
     (calcfx , calcfx = x)) in
(g , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (5,9)-(5,73)) NonRec [(VarPat (Just (5,14)-(5,15)) "g",Lam (Just (5,16)-(5,62)) (VarPat (Just (5,16)-(5,17)) "x") (Let (Just (5,20)-(5,62)) NonRec [(VarPat (Just (5,24)-(5,30)) "calcfx",App (Just (5,33)-(5,36)) (Var (Just (5,33)-(5,34)) "f") [Var (Just (5,35)-(5,36)) "x"])] (Tuple (Just (5,40)-(5,62)) [Var (Just (5,41)-(5,47)) "calcfx",Bop (Just (5,49)-(5,61)) Eq (Var (Just (5,50)-(5,56)) "calcfx") (Var (Just (5,59)-(5,60)) "x")])) Nothing)] (Tuple (Just (5,66)-(5,72)) [Var (Just (5,67)-(5,68)) "g",Var (Just (5,70)-(5,71)) "b"])
*)

(* typed spans
(5,9)-(5,73)
*)

(* correct types
('a -> ('a * bool) * 'a)
*)

(* bad types
('a -> ('a -> 'a * bool) * 'b)
*)
