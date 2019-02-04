
let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile (if (wwhile (f, b)) = b then b else ((wwhile (f, b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let t = f b in if b = t then (b, false) else (t, true) in g),
      b);;

*)

(* changed spans
(6,9)-(6,66)
EMPTY
EmptyG

(6,13)-(6,28)
EMPTY
EmptyG

(6,13)-(6,32)
EMPTY
EmptyG

(6,14)-(6,20)
EMPTY
EmptyG

(6,22)-(6,23)
let g =
  fun b ->
    (let t = f b in
     if b = t
     then (b , false)
     else (t , true)) in
g
LetG NonRec (fromList [LamG EmptyG]) VarG

(6,31)-(6,32)
if b = t
then (b , false)
else (t , true)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(6,38)-(6,39)
b = t
BopG VarG VarG

(6,45)-(6,65)
EMPTY
EmptyG

(6,46)-(6,61)
EMPTY
EmptyG

(6,47)-(6,53)
t
VarG

(6,55)-(6,56)
EMPTY
EmptyG

(6,63)-(6,64)
(t , true)
TupleG (fromList [VarG,LitG])

*)
