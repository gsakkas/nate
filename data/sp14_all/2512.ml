
let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) = wwhile (let g x = f x in (((g b), ((g b) != b)), b));;


(* fix

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let g x = let xx = f x in (xx, (xx != b)) in g), b);;

*)

(* changed spans
(7,28)-(7,73)
(let g =
   fun x ->
     (let xx = f x in
      (xx , xx <> b)) in
 g , b)
TupleG (fromList [VarG,LetG NonRec (fromList [EmptyG]) EmptyG])

*)

(* changed exprs
Tuple (Just (8,9)-(8,62)) [Let (Just (8,10)-(8,58)) NonRec [(VarPat (Just (8,15)-(8,16)) "g",Lam (Just (8,17)-(8,52)) (VarPat (Just (8,17)-(8,18)) "x") (Let (Just (8,21)-(8,52)) NonRec [(VarPat (Just (8,25)-(8,27)) "xx",App (Just (8,30)-(8,33)) (Var (Just (8,30)-(8,31)) "f") [Var (Just (8,32)-(8,33)) "x"])] (Tuple (Just (8,37)-(8,52)) [Var (Just (8,38)-(8,40)) "xx",Bop (Just (8,42)-(8,51)) Neq (Var (Just (8,43)-(8,45)) "xx") (Var (Just (8,49)-(8,50)) "b")])) Nothing)] (Var (Just (8,56)-(8,57)) "g"),Var (Just (8,60)-(8,61)) "b"]
*)

(* typed spans
(8,9)-(8,62)
*)

(* correct types
('a -> ('a * bool) * 'a)
*)

(* bad types
(('a * bool) * 'a)
*)
