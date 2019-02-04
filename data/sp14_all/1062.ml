
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((f b), ((f b) = b), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let fx b' = ((f b'), ((f b') = b')) in wwhile (fx, b);;

*)

(* changed spans
(4,21)-(4,27)
EMPTY
EmptyG

(4,21)-(4,51)
EMPTY
EmptyG

(4,28)-(4,51)
let fx =
  fun b' ->
    (f b' , f b' = b') in
wwhile (fx , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(4,29)-(4,34)
fun b' -> (f b' , f b' = b')
LamG (TupleG (fromList [EmptyG]))

(4,32)-(4,33)
b'
VarG

(4,40)-(4,41)
EMPTY
EmptyG

(4,45)-(4,46)
b'
VarG

(4,49)-(4,50)
wwhile (fx , b)
AppG (fromList [TupleG (fromList [EmptyG])])

*)
