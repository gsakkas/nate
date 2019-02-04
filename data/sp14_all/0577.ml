
let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) =
  wwhile
    (fun y  ->
       fun x  -> let z = f x in if z = b then (x, true) else ((y z), b));;


(* fix

let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) =
  wwhile (let y x = let xx = f x in (xx, (xx != x)) in (y, b));;

*)

(* changed spans
(8,4)-(9,72)
let y =
  fun x ->
    (let xx = f x in
     (xx , xx <> x)) in
(y , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(9,17)-(9,71)
let xx = f x in (xx , xx <> x)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(9,32)-(9,71)
EMPTY
EmptyG

(9,35)-(9,36)
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
