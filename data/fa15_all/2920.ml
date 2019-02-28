
let rec wwhile (f,b) =
  let pair = f b in
  let (b',c') = pair in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((f, (f b)), b);;


(* fix

let rec wwhile (f,b) =
  let pair = f b in
  let (b',c') = pair in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((fun x  -> ((f x), (x != (f x)))), b);;

*)

(* changed spans
(6,29)-(6,39)
fun x -> (f x , x <> f x)
LamG (TupleG (fromList [EmptyG]))

*)

(* changed exprs
Lam (Just (6,29)-(6,62)) (VarPat (Just (6,34)-(6,35)) "x") (Tuple (Just (6,40)-(6,61)) [App (Just (6,41)-(6,46)) (Var (Just (6,42)-(6,43)) "f") [Var (Just (6,44)-(6,45)) "x"],Bop (Just (6,48)-(6,60)) Neq (Var (Just (6,49)-(6,50)) "x") (App (Just (6,54)-(6,59)) (Var (Just (6,55)-(6,56)) "f") [Var (Just (6,57)-(6,58)) "x"])]) Nothing
*)

(* typed spans
(6,29)-(6,62)
*)

(* correct types
'a -> ('a * bool)
*)

(* bad types
('a -> 'b * 'b)
*)
