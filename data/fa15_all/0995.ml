
let helper (f,b) =
  let x = f b in match x with | b -> (x, false) | _ -> (x, true);;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper f b), b);;


(* fix

let helper (f,b) = let f b = let x = f b in (x, (x != b)) in f;;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;

*)

(* changed spans
(3,2)-(3,64)
let f =
  fun b ->
    (let x = f b in
     (x , x <> b)) in
f
LetG NonRec (fromList [LamG EmptyG]) VarG

(8,29)-(8,41)
helper (f , b)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
Let (Just (2,19)-(2,62)) NonRec [(VarPat (Just (2,23)-(2,24)) "f",Lam (Just (2,25)-(2,57)) (VarPat (Just (2,25)-(2,26)) "b") (Let (Just (2,29)-(2,57)) NonRec [(VarPat (Just (2,33)-(2,34)) "x",App (Just (2,37)-(2,40)) (Var (Just (2,37)-(2,38)) "f") [Var (Just (2,39)-(2,40)) "b"])] (Tuple (Just (2,44)-(2,57)) [Var (Just (2,45)-(2,46)) "x",Bop (Just (2,48)-(2,56)) Neq (Var (Just (2,49)-(2,50)) "x") (Var (Just (2,54)-(2,55)) "b")])) Nothing)] (Var (Just (2,61)-(2,62)) "f")
App (Just (7,29)-(7,44)) (Var (Just (7,30)-(7,36)) "helper") [Tuple (Just (7,37)-(7,43)) [Var (Just (7,38)-(7,39)) "f",Var (Just (7,41)-(7,42)) "b"]]
*)

(* typed spans
(2,19)-(2,62)
(7,29)-(7,44)
*)

(* correct types
'a -> ('a * bool)
'a -> ('a * bool)
*)

(* bad types
('a * bool)
'a -> ('a * bool)
*)
