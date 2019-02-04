
let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) =
  wwhile (fun y  -> fun b  -> if (f b) = b then (b, true) else ((y b), b));;


(* fix

let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) =
  wwhile (let y x = let xx = f x in (xx, (xx != x)) in (y, b));;

*)

(* changed spans
(7,9)-(7,74)
EMPTY
EmptyG

(7,20)-(7,73)
EMPTY
EmptyG

(7,30)-(7,73)
EMPTY
EmptyG

(7,33)-(7,38)
fun x ->
  (let xx = f x in
   (xx , xx <> x))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(7,33)-(7,42)
let y =
  fun x ->
    (let xx = f x in
     (xx , xx <> x)) in
(y , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(7,36)-(7,37)
EMPTY
EmptyG

(7,41)-(7,42)
x
VarG

(7,49)-(7,50)
EMPTY
EmptyG

(7,52)-(7,56)
xx
VarG

(7,63)-(7,73)
xx <> x
BopG VarG VarG

(7,64)-(7,69)
EMPTY
EmptyG

(7,71)-(7,72)
EMPTY
EmptyG

*)
