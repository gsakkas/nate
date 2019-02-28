
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let rec funt x = ((funt f b), ((f b) = b)) in wwhile (funt, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let rec funt x = ((f b), ((f b) = b)) in wwhile (funt, b);;

*)

(* changed spans
(7,20)-(7,30)
f b
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (7,20)-(7,25)) (Var (Just (7,21)-(7,22)) "f") [Var (Just (7,23)-(7,24)) "b"]
*)

(* typed spans
(7,20)-(7,25)
*)

(* correct types
'a
*)

(* bad types
'a
*)
