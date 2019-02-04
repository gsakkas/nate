
let rec wwhile (f,b) =
  let (x,y) = f b in if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  wwhile ((if (f b) = b then (b, false) else ((f b), true)), b);;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) =
  wwhile (let g b = ((f b), (if (f b) = b then false else true)) in (g, b));;

*)

(* changed spans
(3,24)-(3,33)
EMPTY
EmptyG

(3,28)-(3,33)
EMPTY
EmptyG

(3,39)-(3,40)
EMPTY
EmptyG

(5,14)-(6,63)
x
VarG

(6,9)-(6,63)
let g =
  fun b ->
    (f b , if f b = b
           then false
           else true) in
(g , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(6,10)-(6,59)
f b
AppG (fromList [VarG])

(6,29)-(6,39)
EMPTY
EmptyG

(6,30)-(6,31)
EMPTY
EmptyG

(6,45)-(6,58)
EMPTY
EmptyG

(6,46)-(6,51)
EMPTY
EmptyG

(6,47)-(6,48)
EMPTY
EmptyG

(6,49)-(6,50)
EMPTY
EmptyG

(6,61)-(6,62)
(g , b)
TupleG (fromList [VarG])

*)
