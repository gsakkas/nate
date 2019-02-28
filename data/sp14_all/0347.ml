
let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) = wwhile (let xx = (b * b) * b in ((xx, (xx < 100)), b));;


(* fix

let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile ((let d x = let xx = f b in (xx, (xx = b)) in d), b);;

*)

(* changed spans
(6,28)-(6,75)
(let d =
   fun x ->
     (let xx = f b in
      (xx , xx = b)) in
 d , b)
TupleG (fromList [VarG,LetG NonRec (fromList [EmptyG]) EmptyG])

*)

(* changed exprs
Tuple (Just (7,9)-(7,61)) [Let (Just (7,10)-(7,57)) NonRec [(VarPat (Just (7,15)-(7,16)) "d",Lam (Just (7,17)-(7,51)) (VarPat (Just (7,17)-(7,18)) "x") (Let (Just (7,21)-(7,51)) NonRec [(VarPat (Just (7,25)-(7,27)) "xx",App (Just (7,30)-(7,33)) (Var (Just (7,30)-(7,31)) "f") [Var (Just (7,32)-(7,33)) "b"])] (Tuple (Just (7,37)-(7,51)) [Var (Just (7,38)-(7,40)) "xx",Bop (Just (7,42)-(7,50)) Eq (Var (Just (7,43)-(7,45)) "xx") (Var (Just (7,48)-(7,49)) "b")])) Nothing)] (Var (Just (7,55)-(7,56)) "d"),Var (Just (7,59)-(7,60)) "b"]
*)

(* typed spans
(7,9)-(7,61)
*)

(* correct types
('a -> ('a * bool) * 'a)
*)

(* bad types
((int * bool) * int)
*)
