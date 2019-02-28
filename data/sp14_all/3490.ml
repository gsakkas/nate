
let notequals x y = x <> y;;

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((notequals b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(5,30)-(5,63)
match c' with
| true -> wwhile (f , b')
| false -> b'
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG]))])

(7,21)-(7,27)
let func =
  fun x ->
    fun x -> (0 , true) in
(func b , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(7,28)-(7,46)
0
LitG

(7,28)-(7,46)
true
LitG

(7,28)-(7,46)
(func b , b)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(7,30)-(7,39)
func
VarG

*)

(* changed exprs
Case (Just (4,15)-(4,71)) (Var (Just (4,22)-(4,24)) "c'") [(LitPat (Just (4,32)-(4,36)) (LB True),Nothing,App (Just (4,41)-(4,55)) (Var (Just (4,41)-(4,47)) "wwhile") [Tuple (Just (4,48)-(4,55)) [Var (Just (4,49)-(4,50)) "f",Var (Just (4,52)-(4,54)) "b'"]]),(LitPat (Just (4,58)-(4,63)) (LB False),Nothing,Var (Just (4,68)-(4,70)) "b'")]
Let (Just (6,28)-(6,71)) NonRec [(VarPat (Just (6,33)-(6,37)) "func",Lam (Just (6,38)-(6,53)) (VarPat (Just (6,38)-(6,39)) "x") (Lam (Just (6,40)-(6,53)) (VarPat (Just (6,40)-(6,41)) "x") (Tuple (Just (6,44)-(6,53)) [Lit (Just (6,45)-(6,46)) (LI 0),Lit (Just (6,48)-(6,52)) (LB True)]) Nothing) Nothing)] (Tuple (Just (6,57)-(6,70)) [App (Just (6,58)-(6,66)) (Var (Just (6,59)-(6,63)) "func") [Var (Just (6,64)-(6,65)) "b"],Var (Just (6,68)-(6,69)) "b"])
Lit (Just (6,45)-(6,46)) (LI 0)
Lit (Just (6,48)-(6,52)) (LB True)
Tuple (Just (6,57)-(6,70)) [App (Just (6,58)-(6,66)) (Var (Just (6,59)-(6,63)) "func") [Var (Just (6,64)-(6,65)) "b"],Var (Just (6,68)-(6,69)) "b"]
Var (Just (6,59)-(6,63)) "func"
*)

(* typed spans
(4,15)-(4,71)
(6,28)-(6,71)
(6,45)-(6,46)
(6,48)-(6,52)
(6,57)-(6,70)
(6,59)-(6,63)
*)

(* correct types
int
(int -> (int * bool) * int)
int
bool
(int -> (int * bool) * int)
int -> int -> (int * bool)
*)

(* bad types
'a
('a -> ('a * bool) * 'a) -> 'a
('a -> bool * 'a)
('a -> bool * 'a)
('a -> bool * 'a)
'a -> 'a -> bool
*)
