
let rec wwhile (f,b) =
  let y = f b in match y with | (b',c') -> if c' then b' else f b';;


(* fix

let rec wwhile (f,b) =
  let y = f b in match y with | (b',c') -> if c' then b' else wwhile (f, b');;

*)

(* changed spans
(3,62)-(3,63)
wwhile
VarG

(3,62)-(3,63)
(f , b')
TupleG (fromList [VarG])

*)

(* changed exprs
Var (Just (3,62)-(3,68)) "wwhile"
Tuple (Just (3,69)-(3,76)) [Var (Just (3,70)-(3,71)) "f",Var (Just (3,73)-(3,75)) "b'"]
*)

(* typed spans
(3,62)-(3,68)
(3,69)-(3,76)
*)

(* correct types
('a -> ('a * bool) * 'a) -> 'a
('a -> ('a * bool) * 'a)
*)

(* bad types
'a -> 'a
'a -> 'a
*)
