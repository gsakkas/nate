
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile b' c' else b';;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

*)

(* changed spans
(2,55)-(2,67)
wwhile (f , b')
AppG (fromList [TupleG (fromList [EmptyG])])

(2,62)-(2,64)
(f , b')
TupleG (fromList [VarG])

(2,65)-(2,67)
EMPTY
EmptyG

*)
