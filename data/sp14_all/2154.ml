
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((fun x  -> x), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) =
  wwhile ((let f x = let xx = (x * x) * x in (xx, (xx < 100)) in f), b);;

*)

(* changed spans
(5,29)-(5,42)
let f =
  fun x ->
    (let xx = (x * x) * x in
     (xx , xx < 100)) in
f
LetG NonRec (fromList [LamG EmptyG]) VarG

*)

(* changed exprs
Let (Just (6,10)-(6,67)) NonRec [(VarPat (Just (6,15)-(6,16)) "f",Lam (Just (6,17)-(6,61)) (VarPat (Just (6,17)-(6,18)) "x") (Let (Just (6,21)-(6,61)) NonRec [(VarPat (Just (6,25)-(6,27)) "xx",Bop (Just (6,30)-(6,41)) Times (Bop (Just (6,30)-(6,37)) Times (Var (Just (6,31)-(6,32)) "x") (Var (Just (6,35)-(6,36)) "x")) (Var (Just (6,40)-(6,41)) "x"))] (Tuple (Just (6,45)-(6,61)) [Var (Just (6,46)-(6,48)) "xx",Bop (Just (6,50)-(6,60)) Lt (Var (Just (6,51)-(6,53)) "xx") (Lit (Just (6,56)-(6,59)) (LI 100))])) Nothing)] (Var (Just (6,65)-(6,66)) "f")
*)

(* typed spans
(6,10)-(6,67)
*)

(* correct types
int -> (int * bool)
*)

(* bad types
'a -> 'a
*)
