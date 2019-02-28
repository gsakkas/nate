
let f' f b = (f b) = b;;

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) = wwhile ((f' f b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' b = if (f b) = b then (b, true) else ((f b), false) in f'), b);;

*)

(* changed spans
(7,29)-(7,37)
let f' =
  fun b ->
    if f b = b
    then (b , true)
    else (f b , false) in
f'
LetG NonRec (fromList [LamG EmptyG]) VarG

(7,39)-(7,40)
b
VarG

*)

(* changed exprs
Let (Just (7,5)-(7,71)) NonRec [(VarPat (Just (7,10)-(7,12)) "f'",Lam (Just (7,13)-(7,64)) (VarPat (Just (7,13)-(7,14)) "b") (Ite (Just (7,17)-(7,64)) (Bop (Just (7,20)-(7,29)) Eq (App (Just (7,20)-(7,25)) (Var (Just (7,21)-(7,22)) "f") [Var (Just (7,23)-(7,24)) "b"]) (Var (Just (7,28)-(7,29)) "b")) (Tuple (Just (7,35)-(7,44)) [Var (Just (7,36)-(7,37)) "b",Lit (Just (7,39)-(7,43)) (LB True)]) (Tuple (Just (7,50)-(7,64)) [App (Just (7,51)-(7,56)) (Var (Just (7,52)-(7,53)) "f") [Var (Just (7,54)-(7,55)) "b"],Lit (Just (7,58)-(7,63)) (LB False)])) Nothing)] (Var (Just (7,68)-(7,70)) "f'")
Var (Just (7,73)-(7,74)) "b"
*)

(* typed spans
(7,5)-(7,71)
(7,73)-(7,74)
*)

(* correct types
'a -> ('a * bool)
'a
*)

(* bad types
bool
'a
*)
