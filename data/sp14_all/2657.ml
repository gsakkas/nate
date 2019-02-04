
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = ((wwhile (f, ((f b) = b))), b);;


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

(4,21)-(4,51)
EMPTY
EmptyG

(4,31)-(4,32)
EMPTY
EmptyG

(4,34)-(4,45)
EMPTY
EmptyG

(4,35)-(4,40)
EMPTY
EmptyG

(4,36)-(4,37)
EMPTY
EmptyG

(4,38)-(4,39)
EMPTY
EmptyG

(4,43)-(4,44)
h
VarG

*)
