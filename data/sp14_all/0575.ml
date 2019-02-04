
let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) =
  wwhile (fun y  -> let x = f b in if x = b then ((x, true), b));;


(* fix

let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) =
  wwhile (let y x = let xx = f x in (xx, (xx != x)) in (y, b));;

*)

(* changed spans
(7,9)-(7,64)
EMPTY
EmptyG

(7,20)-(7,63)
let y =
  fun x ->
    (let xx = f x in
     (xx , xx <> x)) in
(y , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(7,28)-(7,31)
fun x ->
  (let xx = f x in
   (xx , xx <> x))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(7,30)-(7,31)
EMPTY
EmptyG

(7,35)-(7,63)
EMPTY
EmptyG

(7,38)-(7,43)
EMPTY
EmptyG

(7,42)-(7,43)
EMPTY
EmptyG

(7,50)-(7,59)
xx
VarG

(7,51)-(7,52)
xx <> x
BopG VarG VarG

(7,54)-(7,58)
(y , b)
TupleG (fromList [VarG])

(7,61)-(7,62)
y
VarG

*)
