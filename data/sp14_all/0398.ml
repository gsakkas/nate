
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile (if (f b) = b then b else ((f b), b));;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) =
  let f x = let xx = f b in (xx, (xx <> b)) in wwhile (f, b);;

*)

(* changed spans
(5,21)-(5,27)
EMPTY
EmptyG

(5,21)-(5,65)
EMPTY
EmptyG

(5,28)-(5,65)
EMPTY
EmptyG

(5,32)-(5,37)
fun x ->
  (let xx = f b in
   (xx , xx <> b))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(5,32)-(5,41)
let f =
  fun x ->
    (let xx = f b in
     (xx , xx <> b)) in
wwhile (f , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(5,40)-(5,41)
EMPTY
EmptyG

(5,47)-(5,48)
EMPTY
EmptyG

(5,55)-(5,60)
xx <> b
BopG VarG VarG

(5,56)-(5,57)
(f , b)
TupleG (fromList [VarG])

(5,62)-(5,63)
EMPTY
EmptyG

*)
