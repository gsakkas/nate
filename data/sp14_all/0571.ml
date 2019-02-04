
let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) = wwhile (((f b), ((f b) = b)), b);;


(* fix

let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) =
  wwhile (let y x = let xx = f x in (xx, (xx != x)) in (y, b));;

*)

(* changed spans
(6,28)-(6,53)
EMPTY
EmptyG

(6,29)-(6,49)
EMPTY
EmptyG

(6,30)-(6,35)
EMPTY
EmptyG

(6,31)-(6,32)
EMPTY
EmptyG

(6,33)-(6,34)
EMPTY
EmptyG

(6,37)-(6,48)
let y =
  fun x ->
    (let xx = f x in
     (xx , xx <> x)) in
(y , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(6,38)-(6,43)
fun x ->
  (let xx = f x in
   (xx , xx <> x))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(6,41)-(6,42)
EMPTY
EmptyG

(6,46)-(6,47)
x
VarG

(6,51)-(6,52)
(xx , xx <> x)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

*)
