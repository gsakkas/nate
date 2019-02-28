
let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) = wwhile ((fun k  -> fun x  -> (f x) = x), b);;


(* fix

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let g x = let xx = f x in (xx, (xx != b)) in g), b);;

*)

(* changed spans
(7,29)-(7,60)
let g =
  fun x ->
    (let xx = f x in
     (xx , xx <> b)) in
g
LetG NonRec (fromList [LamG EmptyG]) VarG

*)

(* changed exprs
Let (Just (8,10)-(8,58)) NonRec [(VarPat (Just (8,15)-(8,16)) "g",Lam (Just (8,17)-(8,52)) (VarPat (Just (8,17)-(8,18)) "x") (Let (Just (8,21)-(8,52)) NonRec [(VarPat (Just (8,25)-(8,27)) "xx",App (Just (8,30)-(8,33)) (Var (Just (8,30)-(8,31)) "f") [Var (Just (8,32)-(8,33)) "x"])] (Tuple (Just (8,37)-(8,52)) [Var (Just (8,38)-(8,40)) "xx",Bop (Just (8,42)-(8,51)) Neq (Var (Just (8,43)-(8,45)) "xx") (Var (Just (8,49)-(8,50)) "b")])) Nothing)] (Var (Just (8,56)-(8,57)) "g")
*)

(* typed spans
(8,10)-(8,58)
*)

(* correct types
'a -> ('a * bool)
*)

(* bad types
'a -> 'b -> bool
*)
