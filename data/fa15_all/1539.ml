
let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile ((let f' b = if (f b) = b then b else f b in f' f b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' b = if (f b) = b then (b, true) else ((f b), false) in f'), b);;

*)

(* changed spans
(6,40)-(6,41)
(b , true)
TupleG (fromList [VarG,LitG])

(6,47)-(6,50)
(f b , false)
TupleG (fromList [AppG (fromList [EmptyG]),LitG])

(6,54)-(6,60)
false
LitG

*)

(* changed exprs
Tuple (Just (7,35)-(7,44)) [Var (Just (7,36)-(7,37)) "b",Lit (Just (7,39)-(7,43)) (LB True)]
Tuple (Just (7,50)-(7,64)) [App (Just (7,51)-(7,56)) (Var (Just (7,52)-(7,53)) "f") [Var (Just (7,54)-(7,55)) "b"],Lit (Just (7,58)-(7,63)) (LB False)]
Lit (Just (7,58)-(7,63)) (LB False)
*)

(* typed spans
(7,35)-(7,44)
(7,50)-(7,64)
(7,58)-(7,63)
*)

(* correct types
('a * bool)
('a * bool)
bool
*)

(* bad types
'a
'a
'a -> ('a * bool)
*)
