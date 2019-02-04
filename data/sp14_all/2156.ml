
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = if (wwhile (f, b)) = b then b else wwhile (f, (f b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) =
  wwhile ((let f x = let xx = (x * x) * x in (xx, (xx < 100)) in f), b);;

*)

(* changed spans
(5,21)-(5,73)
EMPTY
EmptyG

(5,24)-(5,43)
EMPTY
EmptyG

(5,33)-(5,34)
EMPTY
EmptyG

(5,36)-(5,37)
EMPTY
EmptyG

(5,42)-(5,43)
EMPTY
EmptyG

(5,49)-(5,50)
EMPTY
EmptyG

(5,56)-(5,62)
let f =
  fun x ->
    (let xx = (x * x) * x in
     (xx , xx < 100)) in
f
LetG NonRec (fromList [LamG EmptyG]) VarG

(5,56)-(5,73)
EMPTY
EmptyG

(5,63)-(5,73)
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 100))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(5,64)-(5,65)
EMPTY
EmptyG

(5,67)-(5,72)
xx
VarG

(5,68)-(5,69)
xx < 100
BopG VarG LitG

*)
