
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((match b with | b' -> if b = b' then (b', false) else (b', true)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((fun b'  -> if (f b') = b' then ((f b'), false) else ((f b'), true)), b);;

*)

(* changed spans
(7,5)-(7,70)
EMPTY
EmptyG

(7,12)-(7,13)
fun b' ->
  if f b' = b'
  then (f b' , false)
  else (f b' , true)
LamG (IteG EmptyG EmptyG EmptyG)

(7,30)-(7,31)
f b'
AppG (fromList [VarG])

(7,34)-(7,36)
f
VarG

(7,42)-(7,53)
b'
VarG

(7,43)-(7,45)
f b'
AppG (fromList [VarG])

(7,60)-(7,62)
f b'
AppG (fromList [VarG])

*)
