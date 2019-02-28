
let notEqual x y = (x = y) = false;;

let rec wwhile (f,b) =
  let z = f b in
  match z with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  let newFunc b = ((f b), (notEqual b f b)) in wwhile (newFunc, b);;


(* fix

let notEqual x y = (x = y) = false;;

let rec wwhile (f,b) =
  let z = f b in
  match z with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  let newFunc b = ((f b), (notEqual b (f b))) in wwhile (newFunc, b);;

*)

(* changed spans
(9,26)-(9,42)
notEqual b (f b)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (9,26)-(9,44)) (Var (Just (9,27)-(9,35)) "notEqual") [Var (Just (9,36)-(9,37)) "b",App (Just (9,38)-(9,43)) (Var (Just (9,39)-(9,40)) "f") [Var (Just (9,41)-(9,42)) "b"]]
*)

(* typed spans
(9,26)-(9,44)
*)

(* correct types
bool
*)

(* bad types
bool
*)
