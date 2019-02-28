
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let funt b = if f b then 0 else 1 in wwhile (funt, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(6,53)-(6,54)
(b , true)
TupleG (fromList [VarG,LitG])

(6,39)-(6,40)
(b , false)
TupleG (fromList [VarG,LitG])

*)

(* changed exprs
Tuple (Just (7,27)-(7,36)) [Var (Just (7,28)-(7,29)) "b",Lit (Just (7,31)-(7,35)) (LB True)]
Tuple (Just (7,42)-(7,52)) [Var (Just (7,43)-(7,44)) "b",Lit (Just (7,46)-(7,51)) (LB False)]
*)

(* typed spans
(7,27)-(7,36)
(7,42)-(7,52)
*)

(* correct types
('a * bool)
('a * bool)
*)

(* bad types
int
'a
*)
