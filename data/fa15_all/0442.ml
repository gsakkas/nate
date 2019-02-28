
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let gs x = (x, (((f x) - x) >= 0)) in wwhile ((f gs), b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let gs x = ((f x), (((f x) - x) >= 0)) in wwhile (gs, b);;

*)

(* changed spans
(6,21)-(6,77)
f x
AppG (fromList [VarG])

(6,67)-(6,73)
wwhile (gs , b)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (6,33)-(6,38)) (Var (Just (6,34)-(6,35)) "f") [Var (Just (6,36)-(6,37)) "x"]
App (Just (6,63)-(6,77)) (Var (Just (6,63)-(6,69)) "wwhile") [Tuple (Just (6,70)-(6,77)) [Var (Just (6,71)-(6,73)) "gs",Var (Just (6,75)-(6,76)) "b"]]
*)

(* typed spans
(6,33)-(6,38)
(6,63)-(6,77)
*)

(* correct types
int
int
*)

(* bad types
'a
'a -> ('a * bool)
*)
