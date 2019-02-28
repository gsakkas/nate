
let rec wwhile (f,b) =
  let z = f b in
  match z with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  let newFunc = ((f b), ((b = (f b)) = false)) in wwhile (newFunc, b);;


(* fix

let rec wwhile (f,b) =
  let z = f b in
  match z with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  let newFunc b = ((f b), ((b = (f b)) = false)) in wwhile (newFunc, b);;

*)

(* changed spans
(7,16)-(7,46)
fun b ->
  (f b , (b = f b) = false)
LamG (TupleG (fromList [EmptyG]))

*)

(* changed exprs
Lam (Just (7,14)-(7,48)) (VarPat (Just (7,14)-(7,15)) "b") (Tuple (Just (7,18)-(7,48)) [App (Just (7,19)-(7,24)) (Var (Just (7,20)-(7,21)) "f") [Var (Just (7,22)-(7,23)) "b"],Bop (Just (7,26)-(7,47)) Eq (Bop (Just (7,27)-(7,38)) Eq (Var (Just (7,28)-(7,29)) "b") (App (Just (7,32)-(7,37)) (Var (Just (7,33)-(7,34)) "f") [Var (Just (7,35)-(7,36)) "b"])) (Lit (Just (7,41)-(7,46)) (LB False))]) Nothing
*)

(* typed spans
(7,14)-(7,48)
*)

(* correct types
'a -> ('a * bool)
*)

(* bad types
('a * bool)
*)
