
let helper f b = if (f b) = b then true else false;;

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((helper f b), b);;


(* fix

let helper f b = if (f b) = b then (true, b) else (false, (f b));;

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((helper f), b);;

*)

(* changed spans
(2,35)-(2,39)
(true , b)
TupleG (fromList [VarG,LitG])

(2,45)-(2,50)
(false , f b)
TupleG (fromList [AppG (fromList [EmptyG]),LitG])

(4,16)-(5,63)
f b
AppG (fromList [VarG])

(7,29)-(7,41)
helper f
AppG (fromList [VarG])

*)

(* changed exprs
Tuple (Just (2,35)-(2,44)) [Lit (Just (2,36)-(2,40)) (LB True),Var (Just (2,42)-(2,43)) "b"]
Tuple (Just (2,50)-(2,64)) [Lit (Just (2,51)-(2,56)) (LB False),App (Just (2,58)-(2,63)) (Var (Just (2,59)-(2,60)) "f") [Var (Just (2,61)-(2,62)) "b"]]
App (Just (2,58)-(2,63)) (Var (Just (2,59)-(2,60)) "f") [Var (Just (2,61)-(2,62)) "b"]
App (Just (7,29)-(7,39)) (Var (Just (7,30)-(7,36)) "helper") [Var (Just (7,37)-(7,38)) "f"]
*)

(* typed spans
(2,35)-(2,44)
(2,50)-(2,64)
(2,58)-(2,63)
(7,29)-(7,39)
*)

(* correct types
(bool * bool)
(bool * bool)
bool
bool -> (bool * bool)
*)

(* bad types
bool
bool
('a -> ('a * bool) * 'a) -> 'a
bool
*)
