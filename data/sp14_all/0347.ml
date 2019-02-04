
let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) = wwhile (let xx = (b * b) * b in ((xx, (xx < 100)), b));;


(* fix

let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile ((let d x = let xx = f b in (xx, (xx = b)) in d), b);;

*)

(* changed spans
(6,28)-(6,75)
(let d =
   fun x ->
     (let xx = f b in
      (xx , xx = b)) in
 d , b)
TupleG (fromList [VarG,LetG NonRec (fromList [EmptyG]) EmptyG])

(6,38)-(6,45)
EMPTY
EmptyG

(6,38)-(6,49)
EMPTY
EmptyG

(6,39)-(6,40)
EMPTY
EmptyG

(6,43)-(6,44)
f b
AppG (fromList [VarG])

(6,48)-(6,49)
f
VarG

(6,54)-(6,70)
EMPTY
EmptyG

(6,59)-(6,69)
xx = b
BopG VarG VarG

(6,65)-(6,68)
EMPTY
EmptyG

*)
