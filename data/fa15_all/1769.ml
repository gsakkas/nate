
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let f1 f2 x = if (f2 x) = x then false else true in wwhile ((f1 f), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let f1 f2 x = if (f2 x) = x then (false, x) else (true, (f2 x)) in
  wwhile ((f1 f), b);;

*)

(* changed spans
(6,35)-(6,40)
(false , x)
TupleG (fromList [VarG,LitG])

(6,46)-(6,50)
(true , f2 x)
TupleG (fromList [AppG (fromList [EmptyG]),LitG])

(6,54)-(6,60)
f2
VarG

(6,54)-(6,60)
x
VarG

(6,54)-(6,60)
wwhile (f1 f , b)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
Tuple (Just (6,35)-(6,45)) [Lit (Just (6,36)-(6,41)) (LB False),Var (Just (6,43)-(6,44)) "x"]
Tuple (Just (6,51)-(6,65)) [Lit (Just (6,52)-(6,56)) (LB True),App (Just (6,58)-(6,64)) (Var (Just (6,59)-(6,61)) "f2") [Var (Just (6,62)-(6,63)) "x"]]
Var (Just (6,59)-(6,61)) "f2"
Var (Just (6,62)-(6,63)) "x"
App (Just (7,2)-(7,20)) (Var (Just (7,2)-(7,8)) "wwhile") [Tuple (Just (7,9)-(7,20)) [App (Just (7,10)-(7,16)) (Var (Just (7,11)-(7,13)) "f1") [Var (Just (7,14)-(7,15)) "f"],Var (Just (7,18)-(7,19)) "b"]]
*)

(* typed spans
(6,35)-(6,45)
(6,51)-(6,65)
(6,59)-(6,61)
(6,62)-(6,63)
(7,2)-(7,20)
*)

(* correct types
(bool * bool)
(bool * bool)
bool -> bool
bool
bool
*)

(* bad types
bool
bool
('a -> ('a * bool) * 'a) -> 'a
('a -> ('a * bool) * 'a) -> 'a
('a -> ('a * bool) * 'a) -> 'a
*)
