
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = if (f b) = b then false else true in wwhile (helper, b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = if (f b) = b then (b, false) else ((f b), true) in
  wwhile (helper, b);;

*)

(* changed spans
(5,35)-(5,40)
(b , false)
TupleG (fromList [VarG,LitG])

(5,46)-(5,50)
(f b , true)
TupleG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
Tuple (Just (5,35)-(5,45)) [Var (Just (5,36)-(5,37)) "b",Lit (Just (5,39)-(5,44)) (LB False)]
Tuple (Just (5,51)-(5,64)) [App (Just (5,52)-(5,57)) (Var (Just (5,53)-(5,54)) "f") [Var (Just (5,55)-(5,56)) "b"],Lit (Just (5,59)-(5,63)) (LB True)]
*)

(* typed spans
(5,35)-(5,45)
(5,51)-(5,64)
*)

(* correct types
('a * bool)
('a * bool)
*)

(* bad types
bool
bool
*)
