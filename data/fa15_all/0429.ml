
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt x = let xx = f f (f (f b)) in (xx, ((f b) = b)) in
  wwhile (funt, (f b));;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt x = let xx = f (f (f (f b))) in (xx, ((f b) = b)) in
  wwhile (funt, (f b));;

*)

(* changed spans
(7,24)-(7,37)
f (f (f (f b)))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (7,24)-(7,39)) (Var (Just (7,24)-(7,25)) "f") [App (Just (7,26)-(7,39)) (Var (Just (7,27)-(7,28)) "f") [App (Just (7,29)-(7,38)) (Var (Just (7,30)-(7,31)) "f") [App (Just (7,32)-(7,37)) (Var (Just (7,33)-(7,34)) "f") [Var (Just (7,35)-(7,36)) "b"]]]]
*)

(* typed spans
(7,24)-(7,39)
*)

(* correct types
'a
*)

(* bad types
'a
*)
