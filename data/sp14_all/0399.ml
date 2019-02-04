
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) =
  wwhile (let b' = f b in if b' = b then f b else ((f b'), b));;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) =
  let f x = let xx = f b in (xx, (xx <> b)) in wwhile (f, b);;

*)

(* changed spans
(6,2)-(6,8)
EMPTY
EmptyG

(6,2)-(6,62)
EMPTY
EmptyG

(6,9)-(6,62)
let f =
  fun x ->
    (let xx = f b in
     (xx , xx <> b)) in
wwhile (f , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(6,19)-(6,22)
fun x ->
  (let xx = f b in
   (xx , xx <> b))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(6,26)-(6,61)
EMPTY
EmptyG

(6,29)-(6,31)
(xx , xx <> b)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(6,29)-(6,35)
EMPTY
EmptyG

(6,34)-(6,35)
xx <> b
BopG VarG VarG

(6,41)-(6,42)
EMPTY
EmptyG

(6,43)-(6,44)
wwhile
VarG

(6,51)-(6,57)
EMPTY
EmptyG

(6,54)-(6,56)
EMPTY
EmptyG

*)
