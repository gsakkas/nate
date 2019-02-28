
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' = false then b' else f b';;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' = false then b' else wwhile (f, b');;

*)

(* changed spans
(3,57)-(3,58)
wwhile
VarG

(3,57)-(3,58)
(f , b')
TupleG (fromList [VarG])

*)

(* changed exprs
Var (Just (3,57)-(3,63)) "wwhile"
Tuple (Just (3,64)-(3,71)) [Var (Just (3,65)-(3,66)) "f",Var (Just (3,68)-(3,70)) "b'"]
*)

(* typed spans
(3,57)-(3,63)
(3,64)-(3,71)
*)

(* correct types
('a -> ('a * bool) * 'a) -> 'a
('a -> ('a * bool) * 'a)
*)

(* bad types
'a -> 'a
'a -> 'a
*)
