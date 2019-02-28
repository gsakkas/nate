
let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile f a;;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

*)

(* changed spans
(3,49)-(3,59)
wwhile (f , a)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (3,49)-(3,62)) (Var (Just (3,49)-(3,55)) "wwhile") [Tuple (Just (3,56)-(3,62)) [Var (Just (3,57)-(3,58)) "f",Var (Just (3,60)-(3,61)) "a"]]
*)

(* typed spans
(3,49)-(3,62)
*)

(* correct types
'a
*)

(* bad types
'a
*)
