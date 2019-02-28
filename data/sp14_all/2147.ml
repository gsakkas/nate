
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (if (f b) = b then b else wwhile (f, (f b)));;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) =
  wwhile ((let f x = let xx = (x * x) * x in (xx, (xx < 100)) in f), b);;

*)

(* changed spans
(5,28)-(5,72)
(let f =
   fun x ->
     (let xx = (x * x) * x in
      (xx , xx < 100)) in
 f , b)
TupleG (fromList [VarG,LetG NonRec (fromList [EmptyG]) EmptyG])

*)

(* changed exprs
Tuple (Just (6,9)-(6,71)) [Let (Just (6,10)-(6,67)) NonRec [(VarPat (Just (6,15)-(6,16)) "f",Lam (Just (6,17)-(6,61)) (VarPat (Just (6,17)-(6,18)) "x") (Let (Just (6,21)-(6,61)) NonRec [(VarPat (Just (6,25)-(6,27)) "xx",Bop (Just (6,30)-(6,41)) Times (Bop (Just (6,30)-(6,37)) Times (Var (Just (6,31)-(6,32)) "x") (Var (Just (6,35)-(6,36)) "x")) (Var (Just (6,40)-(6,41)) "x"))] (Tuple (Just (6,45)-(6,61)) [Var (Just (6,46)-(6,48)) "xx",Bop (Just (6,50)-(6,60)) Lt (Var (Just (6,51)-(6,53)) "xx") (Lit (Just (6,56)-(6,59)) (LI 100))])) Nothing)] (Var (Just (6,65)-(6,66)) "f"),Var (Just (6,69)-(6,70)) "b"]
*)

(* typed spans
(6,9)-(6,71)
*)

(* correct types
(int -> (int * bool) * int)
*)

(* bad types
'a
*)
