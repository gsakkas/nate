
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (if (f b) = b then (b, b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) =
  wwhile ((let f x = let xx = (x * x) * x in (xx, (xx < 100)) in f), b);;

*)

(* changed spans
(5,28)-(5,54)
EMPTY
EmptyG

(5,29)-(5,53)
EMPTY
EmptyG

(5,32)-(5,37)
EMPTY
EmptyG

(5,32)-(5,41)
EMPTY
EmptyG

(5,33)-(5,34)
EMPTY
EmptyG

(5,35)-(5,36)
EMPTY
EmptyG

(5,40)-(5,41)
EMPTY
EmptyG

(5,48)-(5,49)
let f =
  fun x ->
    (let xx = (x * x) * x in
     (xx , xx < 100)) in
f
LetG NonRec (fromList [LamG EmptyG]) VarG

(5,51)-(5,52)
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 100))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

*)
