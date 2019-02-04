
let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) =
  wwhile
    (let f x = let xx = (x * x) * x in (xx, (xx < 100)) in
     ((wwhile (f, 2)), b));;


(* fix

let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) =
  wwhile (let y x = let xx = f x in (xx, (xx != x)) in (y, b));;

*)

(* changed spans
(8,4)-(9,26)
let y =
  fun x ->
    (let xx = f x in
     (xx , xx <> x)) in
(y , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(8,24)-(8,31)
EMPTY
EmptyG

(8,24)-(8,35)
EMPTY
EmptyG

(8,25)-(8,26)
EMPTY
EmptyG

(8,29)-(8,30)
f x
AppG (fromList [VarG])

(8,34)-(8,35)
f
VarG

(8,44)-(8,54)
xx <> x
BopG VarG VarG

(8,50)-(8,53)
EMPTY
EmptyG

(9,5)-(9,25)
EMPTY
EmptyG

(9,6)-(9,21)
EMPTY
EmptyG

(9,7)-(9,13)
x
VarG

(9,15)-(9,16)
EMPTY
EmptyG

(9,18)-(9,19)
y
VarG

*)
