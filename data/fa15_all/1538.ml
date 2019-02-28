
let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile ((let f' b' = if (f b') = b then b else f b' in f' b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' b = if (f b) = b then (b, true) else ((f b), false) in f'), b);;

*)

(* changed spans
(6,18)-(6,53)
fun b ->
  if f b = b
  then (b , true)
  else (f b , false)
LamG (IteG EmptyG EmptyG EmptyG)

(6,64)-(6,65)
f'
VarG

*)

(* changed exprs
Lam (Just (7,13)-(7,64)) (VarPat (Just (7,13)-(7,14)) "b") (Ite (Just (7,17)-(7,64)) (Bop (Just (7,20)-(7,29)) Eq (App (Just (7,20)-(7,25)) (Var (Just (7,21)-(7,22)) "f") [Var (Just (7,23)-(7,24)) "b"]) (Var (Just (7,28)-(7,29)) "b")) (Tuple (Just (7,35)-(7,44)) [Var (Just (7,36)-(7,37)) "b",Lit (Just (7,39)-(7,43)) (LB True)]) (Tuple (Just (7,50)-(7,64)) [App (Just (7,51)-(7,56)) (Var (Just (7,52)-(7,53)) "f") [Var (Just (7,54)-(7,55)) "b"],Lit (Just (7,58)-(7,63)) (LB False)])) Nothing
Var (Just (7,68)-(7,70)) "f'"
*)

(* typed spans
(7,13)-(7,64)
(7,68)-(7,70)
*)

(* correct types
'a -> ('a * bool)
'a -> ('a * bool)
*)

(* bad types
('a -> ('a * bool)) -> 'a -> ('a * bool)
'a -> ('a * bool)
*)
