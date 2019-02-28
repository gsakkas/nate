
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let funt x = (f, ((f b) = b)) in wwhile (funt, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let funt x = ((f b), ((f b) = b)) in wwhile (funt, b);;

*)

(* changed spans
(6,21)-(6,70)
f b
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (6,35)-(6,40)) (Var (Just (6,36)-(6,37)) "f") [Var (Just (6,38)-(6,39)) "b"]
*)

(* typed spans
(6,35)-(6,40)
*)

(* correct types
'a
*)

(* bad types
'a
*)
