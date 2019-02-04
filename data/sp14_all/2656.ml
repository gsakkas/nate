
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((f, ((f b) = b)), b);;


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

(4,29)-(4,45)
EMPTY
EmptyG

(4,30)-(4,31)
EMPTY
EmptyG

(4,33)-(4,44)
EMPTY
EmptyG

(4,34)-(4,39)
EMPTY
EmptyG

(4,35)-(4,36)
EMPTY
EmptyG

(4,37)-(4,38)
EMPTY
EmptyG

(4,42)-(4,43)
h
VarG

*)
