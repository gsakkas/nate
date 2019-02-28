
let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) = wwhile ((let g x = (f x) != x in g b), b);;


(* fix

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let g x = let xx = f x in (xx, (xx != b)) in g), b);;

*)

(* changed spans
(7,40)-(7,50)
let xx = f x in (xx , xx <> b)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(7,60)-(7,61)
g
VarG

*)

(* changed exprs
Let (Just (8,21)-(8,52)) NonRec [(VarPat (Just (8,25)-(8,27)) "xx",App (Just (8,30)-(8,33)) (Var (Just (8,30)-(8,31)) "f") [Var (Just (8,32)-(8,33)) "x"])] (Tuple (Just (8,37)-(8,52)) [Var (Just (8,38)-(8,40)) "xx",Bop (Just (8,42)-(8,51)) Neq (Var (Just (8,43)-(8,45)) "xx") (Var (Just (8,49)-(8,50)) "b")])
Var (Just (8,56)-(8,57)) "g"
*)

(* typed spans
(8,21)-(8,52)
(8,56)-(8,57)
*)

(* correct types
('a * bool)
'a -> ('a * bool)
*)

(* bad types
bool
'a
*)
