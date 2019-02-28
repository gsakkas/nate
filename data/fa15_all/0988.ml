
let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((), b);;


(* fix

let helper (f,b) = let f b = let x = f b in (x, (x != b)) in f;;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;

*)

(* changed spans
(3,2)-(3,72)
let f =
  fun b ->
    (let x = f b in
     (x , x <> b)) in
f
LetG NonRec (fromList [LamG EmptyG]) VarG

(3,2)-(3,72)
fun (f , b) ->
  (let (x , y) = f b in
   match y with
   | false -> x
   | true -> wwhile (f , x))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(5,29)-(5,31)
helper (f , b)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
Let (Just (2,19)-(2,62)) NonRec [(VarPat (Just (2,23)-(2,24)) "f",Lam (Just (2,25)-(2,57)) (VarPat (Just (2,25)-(2,26)) "b") (Let (Just (2,29)-(2,57)) NonRec [(VarPat (Just (2,33)-(2,34)) "x",App (Just (2,37)-(2,40)) (Var (Just (2,37)-(2,38)) "f") [Var (Just (2,39)-(2,40)) "b"])] (Tuple (Just (2,44)-(2,57)) [Var (Just (2,45)-(2,46)) "x",Bop (Just (2,48)-(2,56)) Neq (Var (Just (2,49)-(2,50)) "x") (Var (Just (2,54)-(2,55)) "b")])) Nothing)] (Var (Just (2,61)-(2,62)) "f")
Lam (Just (4,16)-(5,72)) (TuplePat (Just (4,16)-(4,19)) [VarPat (Just (4,16)-(4,17)) "f",VarPat (Just (4,18)-(4,19)) "b"]) (Let (Just (5,2)-(5,72)) NonRec [(TuplePat (Just (5,7)-(5,10)) [VarPat (Just (5,7)-(5,8)) "x",VarPat (Just (5,9)-(5,10)) "y"],App (Just (5,14)-(5,17)) (Var (Just (5,14)-(5,15)) "f") [Var (Just (5,16)-(5,17)) "b"])] (Case (Just (5,21)-(5,72)) (Var (Just (5,27)-(5,28)) "y") [(LitPat (Just (5,36)-(5,41)) (LB False),Nothing,Var (Just (5,46)-(5,47)) "x"),(LitPat (Just (5,50)-(5,54)) (LB True),Nothing,App (Just (5,59)-(5,72)) (Var (Just (5,59)-(5,65)) "wwhile") [Tuple (Just (5,66)-(5,72)) [Var (Just (5,67)-(5,68)) "f",Var (Just (5,70)-(5,71)) "x"]])])) Nothing
App (Just (7,29)-(7,44)) (Var (Just (7,30)-(7,36)) "helper") [Tuple (Just (7,37)-(7,43)) [Var (Just (7,38)-(7,39)) "f",Var (Just (7,41)-(7,42)) "b"]]
*)

(* typed spans
(2,19)-(2,62)
(4,16)-(5,72)
(7,29)-(7,44)
*)

(* correct types
'a -> ('a * bool)
('a -> ('a * bool) * 'a) -> 'a
'a -> ('a * bool)
*)

(* bad types
'a
'a
unit
*)
