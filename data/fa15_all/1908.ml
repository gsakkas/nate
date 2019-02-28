
let intboolf f b = ((f b), ((f b) == 0));;

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (intboolf, b);;


(* fix

let func (f,b) b = ((f b), ((f b) == b));;

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((func (f, b)), b);;

*)

(* changed spans
(2,13)-(2,40)
fun (f , b) ->
  fun b -> (f b , f b = b)
LamG (LamG EmptyG)

(7,29)-(7,37)
func (f , b)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
Lam (Just (2,10)-(2,40)) (TuplePat (Just (2,10)-(2,13)) [VarPat (Just (2,10)-(2,11)) "f",VarPat (Just (2,12)-(2,13)) "b"]) (Lam (Just (2,15)-(2,40)) (VarPat (Just (2,15)-(2,16)) "b") (Tuple (Just (2,19)-(2,40)) [App (Just (2,20)-(2,25)) (Var (Just (2,21)-(2,22)) "f") [Var (Just (2,23)-(2,24)) "b"],Bop (Just (2,27)-(2,39)) Eq (App (Just (2,28)-(2,33)) (Var (Just (2,29)-(2,30)) "f") [Var (Just (2,31)-(2,32)) "b"]) (Var (Just (2,37)-(2,38)) "b")]) Nothing) Nothing
App (Just (7,29)-(7,42)) (Var (Just (7,30)-(7,34)) "func") [Tuple (Just (7,35)-(7,41)) [Var (Just (7,36)-(7,37)) "f",Var (Just (7,39)-(7,40)) "b"]]
*)

(* typed spans
(2,10)-(2,40)
(7,29)-(7,42)
*)

(* correct types
('a -> 'a * 'a) -> 'a -> ('a * bool)
'a -> ('a * bool)
*)

(* bad types
('a -> int) -> 'a -> (int * bool)
('a -> int) -> 'a -> (int * bool)
*)
