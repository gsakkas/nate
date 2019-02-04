
let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile (if f = true then b else ((wwhile ((f b), b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let t = f b in if b = t then (b, false) else (t, true) in g),
      b);;

*)

(* changed spans
(6,9)-(6,59)
EMPTY
EmptyG

(6,13)-(6,14)
EMPTY
EmptyG

(6,13)-(6,21)
EMPTY
EmptyG

(6,17)-(6,21)
EMPTY
EmptyG

(6,27)-(6,28)
EMPTY
EmptyG

(6,35)-(6,54)
EMPTY
EmptyG

(6,36)-(6,42)
EMPTY
EmptyG

(6,43)-(6,53)
let g =
  fun b ->
    (let t = f b in
     if b = t
     then (b , false)
     else (t , true)) in
g
LetG NonRec (fromList [LamG EmptyG]) VarG

(6,44)-(6,49)
fun b ->
  (let t = f b in
   if b = t
   then (b , false)
   else (t , true))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(6,51)-(6,52)
if b = t
then (b , false)
else (t , true)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(6,56)-(6,57)
(b , false)
TupleG (fromList [VarG,LitG])

*)
