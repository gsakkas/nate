
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let b' = f b in wwhile ((f, (b' = b)), b);;


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

(4,21)-(4,62)
EMPTY
EmptyG

(4,30)-(4,31)
EMPTY
EmptyG

(4,32)-(4,33)
EMPTY
EmptyG

(4,37)-(4,62)
EMPTY
EmptyG

(4,45)-(4,58)
EMPTY
EmptyG

(4,46)-(4,47)
EMPTY
EmptyG

(4,49)-(4,57)
EMPTY
EmptyG

(4,50)-(4,52)
EMPTY
EmptyG

(4,55)-(4,56)
h
VarG

*)
