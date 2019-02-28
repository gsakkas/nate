
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile ((f b), x) | (x,y) -> x;;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

*)

(* changed spans
(4,50)-(4,55)
wwhile (f , x)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (4,42)-(4,55)) (Var (Just (4,42)-(4,48)) "wwhile") [Tuple (Just (4,49)-(4,55)) [Var (Just (4,50)-(4,51)) "f",Var (Just (4,53)-(4,54)) "x"]]
*)

(* typed spans
(4,42)-(4,55)
*)

(* correct types
'a
*)

(* bad types
('a * bool)
*)
