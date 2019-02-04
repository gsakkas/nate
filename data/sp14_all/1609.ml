
let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) =
  wwhile ((let (x,y) = f b in (x, ((x > b) || (x < b)))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) =
  wwhile ((let a x = let xx = f x in (xx, (x <> b)) in a), b);;

*)

(* changed spans
(6,10)-(6,56)
let a =
  fun x ->
    (let xx = f x in
     (xx , x <> b)) in
a
LetG NonRec (fromList [LamG EmptyG]) VarG

(6,23)-(6,26)
fun x ->
  (let xx = f x in
   (xx , x <> b))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(6,25)-(6,26)
EMPTY
EmptyG

(6,30)-(6,55)
EMPTY
EmptyG

(6,34)-(6,54)
EMPTY
EmptyG

(6,35)-(6,42)
EMPTY
EmptyG

(6,36)-(6,37)
EMPTY
EmptyG

(6,40)-(6,41)
EMPTY
EmptyG

(6,46)-(6,53)
(xx , x <> b)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(6,47)-(6,48)
x <> b
BopG VarG VarG

(6,58)-(6,59)
a
VarG

*)
