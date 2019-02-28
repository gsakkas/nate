
let rec wwhile (f,b) =
  match f with | (x,true ) -> wwhile (f x) | (x,false ) -> x;;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

*)

(* changed spans
(3,8)-(3,9)
f b
AppG (fromList [VarG])

(3,37)-(3,42)
(f , x)
TupleG (fromList [VarG])

*)

(* changed exprs
App (Just (3,8)-(3,11)) (Var (Just (3,8)-(3,9)) "f") [Var (Just (3,10)-(3,11)) "b"]
Tuple (Just (3,39)-(3,45)) [Var (Just (3,40)-(3,41)) "f",Var (Just (3,43)-(3,44)) "x"]
*)

(* typed spans
(3,8)-(3,11)
(3,39)-(3,45)
*)

(* correct types
('a * bool)
('a -> ('a * bool) * 'a)
*)

(* bad types
'a -> 'b
'a
*)
