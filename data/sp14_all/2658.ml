
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = ((wwhile (f, (b, ((f b) = b)))), b);;


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

(4,21)-(4,56)
EMPTY
EmptyG

(4,31)-(4,32)
EMPTY
EmptyG

(4,34)-(4,50)
EMPTY
EmptyG

(4,35)-(4,36)
EMPTY
EmptyG

(4,38)-(4,49)
EMPTY
EmptyG

(4,39)-(4,44)
EMPTY
EmptyG

(4,40)-(4,41)
EMPTY
EmptyG

(4,42)-(4,43)
EMPTY
EmptyG

(4,47)-(4,48)
h
VarG

*)
