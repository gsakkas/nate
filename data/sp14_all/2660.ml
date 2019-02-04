
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (f, ((f b) = b), b);;


(* fix

let h x = let xx = (x * x) * x in (xx, (xx < 512));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(2,16)-(2,77)
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 512))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(4,28)-(4,47)
EMPTY
EmptyG

(4,29)-(4,30)
EMPTY
EmptyG

(4,32)-(4,43)
EMPTY
EmptyG

(4,33)-(4,38)
EMPTY
EmptyG

(4,34)-(4,35)
EMPTY
EmptyG

(4,36)-(4,37)
EMPTY
EmptyG

(4,41)-(4,42)
(h , b)
TupleG (fromList [VarG])

(4,45)-(4,46)
h
VarG

*)
