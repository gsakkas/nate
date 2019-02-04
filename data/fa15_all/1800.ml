
let rec wwhile (f,b) = let (i,t) = f b in if t then wwhile (f, i) else i;;

let fixpoint (f,b) = wwhile (((f b) = b), b);;


(* fix

let rec wwhile (f,b) = let (i,t) = f b in if t then wwhile (f, i) else i;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let xx = f b in if b = xx then (xx, false) else (xx, true) in
      g), b);;

*)

(* changed spans
(4,29)-(4,40)
let g =
  fun b ->
    (let xx = f b in
     if b = xx
     then (xx , false)
     else (xx , true)) in
g
LetG NonRec (fromList [LamG EmptyG]) VarG

(4,30)-(4,35)
fun b ->
  (let xx = f b in
   if b = xx
   then (xx , false)
   else (xx , true))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(4,38)-(4,39)
if b = xx
then (xx , false)
else (xx , true)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(4,42)-(4,43)
(xx , true)
TupleG (fromList [VarG,LitG])

*)
