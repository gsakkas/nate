
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((f, true), b);;


(* fix

let func (f,b) b = ((f b), ((f b) == b));;

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((func (f, b)), b);;

*)

(* changed spans
(3,2)-(3,63)
fun b -> (f b , f b = b)
LamG (TupleG (fromList [EmptyG]))

(3,2)-(3,63)
fun (f , b) ->
  match f b with
  | (b' , c') -> if c'
                 then wwhile (f , b')
                 else b'
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(5,29)-(5,38)
func (f , b)
AppG (fromList [TupleG (fromList [EmptyG])])

(5,40)-(5,41)
b
VarG

*)

(* changed exprs
Lam (Just (2,15)-(2,40)) (VarPat (Just (2,15)-(2,16)) "b") (Tuple (Just (2,19)-(2,40)) [App (Just (2,20)-(2,25)) (Var (Just (2,21)-(2,22)) "f") [Var (Just (2,23)-(2,24)) "b"],Bop (Just (2,27)-(2,39)) Eq (App (Just (2,28)-(2,33)) (Var (Just (2,29)-(2,30)) "f") [Var (Just (2,31)-(2,32)) "b"]) (Var (Just (2,37)-(2,38)) "b")]) Nothing
Lam (Just (4,16)-(5,63)) (TuplePat (Just (4,16)-(4,19)) [VarPat (Just (4,16)-(4,17)) "f",VarPat (Just (4,18)-(4,19)) "b"]) (Case (Just (5,2)-(5,63)) (App (Just (5,8)-(5,11)) (Var (Just (5,8)-(5,9)) "f") [Var (Just (5,10)-(5,11)) "b"]) [(TuplePat (Just (5,20)-(5,25)) [VarPat (Just (5,20)-(5,22)) "b'",VarPat (Just (5,23)-(5,25)) "c'"],Nothing,Ite (Just (5,30)-(5,63)) (Var (Just (5,33)-(5,35)) "c'") (App (Just (5,41)-(5,55)) (Var (Just (5,41)-(5,47)) "wwhile") [Tuple (Just (5,48)-(5,55)) [Var (Just (5,49)-(5,50)) "f",Var (Just (5,52)-(5,54)) "b'"]]) (Var (Just (5,61)-(5,63)) "b'"))]) Nothing
App (Just (7,29)-(7,42)) (Var (Just (7,30)-(7,34)) "func") [Tuple (Just (7,35)-(7,41)) [Var (Just (7,36)-(7,37)) "f",Var (Just (7,39)-(7,40)) "b"]]
Var (Just (7,44)-(7,45)) "b"
*)

(* typed spans
(2,15)-(2,40)
(4,16)-(5,63)
(7,29)-(7,42)
(7,44)-(7,45)
*)

(* correct types
'a -> ('a * bool)
('a -> ('a * bool) * 'a) -> 'a
'a -> ('a * bool)
'a
*)

(* bad types
'a
'a
('a * bool)
'a
*)
