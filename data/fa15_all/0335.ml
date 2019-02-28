
let fixpointHelper f =
  match f with | (num,expr) -> if expr then (num, true) else (num, false);;

let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile ((fixpointHelper f), b);;


(* fix

let fixpointHelper f b b = ((f b), (if (f b) = b then true else false));;

let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile ((fixpointHelper f b), b);;

*)

(* changed spans
(3,2)-(3,73)
fun b ->
  fun b ->
    (f b , if f b = b
           then true
           else false)
LamG (LamG EmptyG)

(8,29)-(8,47)
fixpointHelper f b
AppG (fromList [VarG])

*)

(* changed exprs
Lam (Just (2,21)-(2,71)) (VarPat (Just (2,21)-(2,22)) "b") (Lam (Just (2,23)-(2,71)) (VarPat (Just (2,23)-(2,24)) "b") (Tuple (Just (2,27)-(2,71)) [App (Just (2,28)-(2,33)) (Var (Just (2,29)-(2,30)) "f") [Var (Just (2,31)-(2,32)) "b"],Ite (Just (2,35)-(2,70)) (Bop (Just (2,39)-(2,48)) Eq (App (Just (2,39)-(2,44)) (Var (Just (2,40)-(2,41)) "f") [Var (Just (2,42)-(2,43)) "b"]) (Var (Just (2,47)-(2,48)) "b")) (Lit (Just (2,54)-(2,58)) (LB True)) (Lit (Just (2,64)-(2,69)) (LB False))]) Nothing) Nothing
App (Just (7,29)-(7,49)) (Var (Just (7,30)-(7,44)) "fixpointHelper") [Var (Just (7,45)-(7,46)) "f",Var (Just (7,47)-(7,48)) "b"]
*)

(* typed spans
(2,21)-(2,71)
(7,29)-(7,49)
*)

(* correct types
'a -> 'a -> ('a * bool)
'a -> ('a * bool)
*)

(* bad types
('a * bool)
('a * bool)
*)
