
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile b' c' else b';;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

*)

(* changed spans
(2,55)-(2,67)
wwhile (f , b')
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (2,55)-(2,69)) (Var (Just (2,55)-(2,61)) "wwhile") [Tuple (Just (2,62)-(2,69)) [Var (Just (2,63)-(2,64)) "f",Var (Just (2,66)-(2,68)) "b'"]]
*)

(* typed spans
(2,55)-(2,69)
*)

(* correct types
'a
*)

(* bad types
'a
*)
