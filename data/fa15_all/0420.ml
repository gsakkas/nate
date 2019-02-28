
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then b else b in wwhile ((funt b), b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(7,18)-(7,21)
(b , true)
TupleG (fromList [VarG,LitG])

(7,18)-(7,19)
(b , false)
TupleG (fromList [VarG,LitG])

(7,20)-(7,21)
false
LitG

(7,47)-(7,55)
wwhile (funt , b)
AppG (fromList [TupleG (fromList [EmptyG])])

(7,47)-(7,55)
wwhile
VarG

(7,57)-(7,58)
EMPTY
EmptyG

*)

(* changed exprs
Tuple (Just (7,27)-(7,36)) [Var (Just (7,28)-(7,29)) "b",Lit (Just (7,31)-(7,35)) (LB True)]
Tuple (Just (7,42)-(7,52)) [Var (Just (7,43)-(7,44)) "b",Lit (Just (7,46)-(7,51)) (LB False)]
Lit (Just (7,46)-(7,51)) (LB False)
App (Just (7,56)-(7,72)) (Var (Just (7,56)-(7,62)) "wwhile") [Tuple (Just (7,63)-(7,72)) [Var (Just (7,64)-(7,68)) "funt",Var (Just (7,70)-(7,71)) "b"]]
Var (Just (7,56)-(7,62)) "wwhile"
Var (Just (7,57)-(7,58)) "EMPTY"
*)

(* typed spans
(7,27)-(7,36)
(7,42)-(7,52)
(7,46)-(7,51)
(7,56)-(7,72)
(7,56)-(7,62)
*)

(* correct types
('a * bool)
('a * bool)
bool
'a
('a -> ('a * bool) * 'a) -> 'a
*)

(* bad types
bool
('a -> ('a * bool)) -> bool
'a -> ('a * bool)
'a -> ('a * bool)
'a -> ('a * bool)
*)
