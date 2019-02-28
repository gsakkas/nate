
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let funt x = b in wwhile (funt, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let funt x = ((f b), ((f b) = b)) in wwhile (funt, b);;

*)

(* changed spans
(6,14)-(6,55)
(f b , f b = b)
TupleG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

(6,30)-(6,35)
wwhile (funt , b)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
Tuple (Just (6,34)-(6,54)) [App (Just (6,35)-(6,40)) (Var (Just (6,36)-(6,37)) "f") [Var (Just (6,38)-(6,39)) "b"],Bop (Just (6,42)-(6,53)) Eq (App (Just (6,43)-(6,48)) (Var (Just (6,44)-(6,45)) "f") [Var (Just (6,46)-(6,47)) "b"]) (Var (Just (6,51)-(6,52)) "b")]
App (Just (6,58)-(6,74)) (Var (Just (6,58)-(6,64)) "wwhile") [Tuple (Just (6,65)-(6,74)) [Var (Just (6,66)-(6,70)) "funt",Var (Just (6,72)-(6,73)) "b"]]
*)

(* typed spans
(6,34)-(6,54)
(6,58)-(6,74)
*)

(* correct types
('a * bool)
'a
*)

(* bad types
('a * ('b * bool)) -> 'c
'a -> ('a * bool)
*)
