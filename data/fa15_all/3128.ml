
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((match b with | b' -> if b = b' then (b, false) else (b, true)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((fun b'  -> if (f b') = b' then ((f b'), false) else ((f b'), true)), b);;

*)

(* changed spans
(6,10)-(6,73)
EMPTY
EmptyG

(6,17)-(6,18)
fun b' ->
  if f b' = b'
  then (f b' , false)
  else (f b' , true)
LamG (IteG EmptyG EmptyG EmptyG)

(6,35)-(6,36)
f b'
AppG (fromList [VarG])

(6,39)-(6,41)
f
VarG

(6,47)-(6,57)
b'
VarG

(6,48)-(6,49)
f b'
AppG (fromList [VarG])

(6,51)-(6,56)
b'
VarG

(6,64)-(6,65)
f b'
AppG (fromList [VarG])

(6,67)-(6,71)
b'
VarG

*)
