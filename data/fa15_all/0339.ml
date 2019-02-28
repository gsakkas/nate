
let fixpointHelper f b =
  let c = f b in if c = b then (c, true) else (c, false);;

let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile ((fixpointHelper f b), b);;


(* fix

let fixpointHelper f b b = ((f b), (if (f b) = b then true else false));;

let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile ((fixpointHelper f b), b);;

*)

(* changed spans
(3,2)-(3,56)
fun b ->
  (f b , if f b = b
         then true
         else false)
LamG (TupleG (fromList [EmptyG]))

*)

(* changed exprs
Lam (Just (2,23)-(2,71)) (VarPat (Just (2,23)-(2,24)) "b") (Tuple (Just (2,27)-(2,71)) [App (Just (2,28)-(2,33)) (Var (Just (2,29)-(2,30)) "f") [Var (Just (2,31)-(2,32)) "b"],Ite (Just (2,35)-(2,70)) (Bop (Just (2,39)-(2,48)) Eq (App (Just (2,39)-(2,44)) (Var (Just (2,40)-(2,41)) "f") [Var (Just (2,42)-(2,43)) "b"]) (Var (Just (2,47)-(2,48)) "b")) (Lit (Just (2,54)-(2,58)) (LB True)) (Lit (Just (2,64)-(2,69)) (LB False))]) Nothing
*)

(* typed spans
(2,23)-(2,71)
*)

(* correct types
'a -> ('a * bool)
*)

(* bad types
('a * bool)
*)
