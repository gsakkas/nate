
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((match b with | b' -> if b = b' then (b', false) else (b', true)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((fun b'  -> if (f b') = b' then ((f b'), false) else ((f b'), true)), b);;

*)

(* changed spans
(7,5)-(7,70)
fun b' ->
  if f b' = b'
  then (f b' , false)
  else (f b' , true)
LamG (IteG EmptyG EmptyG EmptyG)

*)

(* changed exprs
Lam (Just (7,5)-(7,73)) (VarPat (Just (7,10)-(7,12)) "b'") (Ite (Just (7,17)-(7,72)) (Bop (Just (7,20)-(7,31)) Eq (App (Just (7,20)-(7,26)) (Var (Just (7,21)-(7,22)) "f") [Var (Just (7,23)-(7,25)) "b'"]) (Var (Just (7,29)-(7,31)) "b'")) (Tuple (Just (7,37)-(7,52)) [App (Just (7,38)-(7,44)) (Var (Just (7,39)-(7,40)) "f") [Var (Just (7,41)-(7,43)) "b'"],Lit (Just (7,46)-(7,51)) (LB False)]) (Tuple (Just (7,58)-(7,72)) [App (Just (7,59)-(7,65)) (Var (Just (7,60)-(7,61)) "f") [Var (Just (7,62)-(7,64)) "b'"],Lit (Just (7,67)-(7,71)) (LB True)])) Nothing
*)

(* typed spans
(7,5)-(7,73)
*)

(* correct types
'a -> ('a * bool)
*)

(* bad types
('a * bool)
*)
