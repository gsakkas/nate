
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let b' = f b in ((f, (b' = b)), b));;


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

(4,28)-(4,64)
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

(4,46)-(4,59)
EMPTY
EmptyG

(4,47)-(4,48)
EMPTY
EmptyG

(4,50)-(4,58)
EMPTY
EmptyG

(4,51)-(4,53)
EMPTY
EmptyG

(4,56)-(4,57)
h
VarG

*)
