
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let f' = if (f b) = b then (b, true) else (b, false) in wwhile (f', b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let f' b' = if (f b') = b' then (b', true) else (b', false) in
  wwhile (f', b);;

*)

(* changed spans
(6,11)-(6,54)
fun b' ->
  if f b' = b'
  then (b' , true)
  else (b' , false)
LamG (IteG EmptyG EmptyG EmptyG)

*)

(* changed exprs
Lam (Just (6,9)-(6,61)) (VarPat (Just (6,9)-(6,11)) "b'") (Ite (Just (6,14)-(6,61)) (Bop (Just (6,17)-(6,28)) Eq (App (Just (6,17)-(6,23)) (Var (Just (6,18)-(6,19)) "f") [Var (Just (6,20)-(6,22)) "b'"]) (Var (Just (6,26)-(6,28)) "b'")) (Tuple (Just (6,34)-(6,44)) [Var (Just (6,35)-(6,37)) "b'",Lit (Just (6,39)-(6,43)) (LB True)]) (Tuple (Just (6,50)-(6,61)) [Var (Just (6,51)-(6,53)) "b'",Lit (Just (6,55)-(6,60)) (LB False)])) Nothing
*)

(* typed spans
(6,9)-(6,61)
*)

(* correct types
'a -> ('a * bool)
*)

(* bad types
('a * bool)
*)
