
let rec wwhile (f,b) = match f b with | (b',c') -> if c' then f b' else b';;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

*)

(* changed spans
(2,62)-(2,63)
wwhile
VarG

(2,62)-(2,63)
(f , b')
TupleG (fromList [VarG])

*)

(* changed exprs
Var (Just (3,41)-(3,47)) "wwhile"
Tuple (Just (3,48)-(3,55)) [Var (Just (3,49)-(3,50)) "f",Var (Just (3,52)-(3,54)) "b'"]
*)

(* typed spans
(3,41)-(3,47)
(3,48)-(3,55)
*)

(* correct types
('a -> ('a * bool) * 'a) -> 'a
('a -> ('a * bool) * 'a)
*)

(* bad types
'a -> 'a
'a -> 'a
*)
