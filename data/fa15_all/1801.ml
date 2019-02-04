
let rec wwhile (f,b) = let (i,t) = f b in if t then wwhile (f, i) else i;;

let fixpoint (f,b) = wwhile ((let (i,t) = f b in i = b), b);;


(* fix

let rec wwhile (f,b) = let (i,t) = f b in if t then wwhile (f, i) else i;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let xx = f b in if b = xx then (xx, false) else (xx, true) in
      g), b);;

*)

(* changed spans
(4,29)-(4,55)
let g =
  fun b ->
    (let xx = f b in
     if b = xx
     then (xx , false)
     else (xx , true)) in
g
LetG NonRec (fromList [LamG EmptyG]) VarG

(4,42)-(4,45)
fun b ->
  (let xx = f b in
   if b = xx
   then (xx , false)
   else (xx , true))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(4,49)-(4,50)
EMPTY
EmptyG

(4,49)-(4,54)
if b = xx
then (xx , false)
else (xx , true)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(4,57)-(4,58)
(xx , true)
TupleG (fromList [VarG,LitG])

*)
