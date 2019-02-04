
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((((f b) = b), b), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let fx b' = ((f b'), ((f b') = b')) in wwhile (fx, b);;

*)

(* changed spans
(4,21)-(4,27)
EMPTY
EmptyG

(4,21)-(4,49)
EMPTY
EmptyG

(4,28)-(4,49)
let fx =
  fun b' ->
    (f b' , f b' = b') in
wwhile (fx , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(4,29)-(4,45)
fun b' -> (f b' , f b' = b')
LamG (TupleG (fromList [EmptyG]))

(4,30)-(4,41)
f b'
AppG (fromList [VarG])

(4,34)-(4,35)
EMPTY
EmptyG

(4,39)-(4,40)
EMPTY
EmptyG

(4,43)-(4,44)
b'
VarG

(4,47)-(4,48)
wwhile (fx , b)
AppG (fromList [TupleG (fromList [EmptyG])])

*)
