
let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) =
  wwhile
    (fun y  ->
       fun b  -> let x = f b in if x = b then (x, true) else ((y x), b));;


(* fix

let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) =
  wwhile (let y x = let xx = f x in (xx, (xx != x)) in (y, b));;

*)

(* changed spans
(8,4)-(9,72)
EMPTY
EmptyG

(9,7)-(9,71)
EMPTY
EmptyG

(9,17)-(9,71)
let y =
  fun x ->
    (let xx = f x in
     (xx , xx <> x)) in
(y , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(9,25)-(9,28)
fun x ->
  (let xx = f x in
   (xx , xx <> x))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(9,27)-(9,28)
EMPTY
EmptyG

(9,32)-(9,71)
EMPTY
EmptyG

(9,35)-(9,40)
EMPTY
EmptyG

(9,39)-(9,40)
EMPTY
EmptyG

(9,47)-(9,48)
xx <> x
BopG VarG VarG

(9,50)-(9,54)
EMPTY
EmptyG

(9,62)-(9,67)
EMPTY
EmptyG

(9,65)-(9,66)
EMPTY
EmptyG

*)
