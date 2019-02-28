
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f b') else b';;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

*)

(* changed spans
(2,62)-(2,68)
(f , b')
TupleG (fromList [VarG])

*)

(* changed exprs
Tuple (Just (2,62)-(2,69)) [Var (Just (2,63)-(2,64)) "f",Var (Just (2,66)-(2,68)) "b'"]
*)

(* typed spans
(2,62)-(2,69)
*)

(* correct types
('a -> ('a * bool) * 'a)
*)

(* bad types
('a * bool)
*)
