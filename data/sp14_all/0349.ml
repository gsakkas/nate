
let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) = wwhile ((((b * b) * b), (b < 100)), b);;


(* fix

let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile ((let d x = let xx = f b in (xx, (xx = b)) in d), b);;

*)

(* changed spans
(6,29)-(6,55)
EMPTY
EmptyG

(6,30)-(6,43)
EMPTY
EmptyG

(6,31)-(6,38)
EMPTY
EmptyG

(6,32)-(6,33)
EMPTY
EmptyG

(6,36)-(6,37)
let d =
  fun x ->
    (let xx = f b in
     (xx , xx = b)) in
d
LetG NonRec (fromList [LamG EmptyG]) VarG

(6,41)-(6,42)
fun x ->
  (let xx = f b in
   (xx , xx = b))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(6,45)-(6,54)
(xx , xx = b)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(6,46)-(6,47)
xx = b
BopG VarG VarG

(6,50)-(6,53)
d
VarG

*)
