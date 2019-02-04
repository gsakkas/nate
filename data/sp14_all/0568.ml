
let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) = wwhile (fun y  -> fun b  -> (((f b), true), b));;


(* fix

let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) =
  wwhile (let y x = let xx = f x in (xx, (xx != x)) in (y, b));;

*)

(* changed spans
(6,28)-(6,68)
EMPTY
EmptyG

(6,39)-(6,67)
EMPTY
EmptyG

(6,49)-(6,67)
EMPTY
EmptyG

(6,50)-(6,63)
let y =
  fun x ->
    (let xx = f x in
     (xx , xx <> x)) in
(y , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(6,51)-(6,56)
fun x ->
  (let xx = f x in
   (xx , xx <> x))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(6,54)-(6,55)
EMPTY
EmptyG

(6,58)-(6,62)
x
VarG

(6,65)-(6,66)
(xx , xx <> x)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

*)
