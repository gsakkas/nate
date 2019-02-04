
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let b' = f b in ((b' = b), b));;


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

(4,28)-(4,59)
EMPTY
EmptyG

(4,38)-(4,39)
EMPTY
EmptyG

(4,38)-(4,41)
EMPTY
EmptyG

(4,40)-(4,41)
EMPTY
EmptyG

(4,46)-(4,54)
EMPTY
EmptyG

(4,47)-(4,49)
EMPTY
EmptyG

(4,52)-(4,53)
h
VarG

*)
