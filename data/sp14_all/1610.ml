
let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) = wwhile ((let (x,y) = f b in (x, (x < 100))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) =
  wwhile ((let a x = let xx = f x in (xx, (x <> b)) in a), b);;

*)

(* changed spans
(5,29)-(5,64)
let a =
  fun x ->
    (let xx = f x in
     (xx , x <> b)) in
a
LetG NonRec (fromList [LamG EmptyG]) VarG

(5,42)-(5,45)
fun x ->
  (let xx = f x in
   (xx , x <> b))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(5,44)-(5,45)
EMPTY
EmptyG

(5,49)-(5,63)
EMPTY
EmptyG

(5,53)-(5,62)
(xx , x <> b)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(5,54)-(5,55)
x <> b
BopG VarG VarG

(5,58)-(5,61)
EMPTY
EmptyG

*)
