
let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) = wwhile ((f, (b, (if (f b) == b then b else f b))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' b = if (f b) = b then (b, true) else ((f b), false) in f'), b);;

*)

(* changed spans
(5,29)-(5,70)
EMPTY
EmptyG

(5,30)-(5,31)
EMPTY
EmptyG

(5,33)-(5,69)
EMPTY
EmptyG

(5,34)-(5,35)
let f' =
  fun b ->
    if f b = b
    then (b , true)
    else (f b , false) in
f'
LetG NonRec (fromList [LamG EmptyG]) VarG

(5,37)-(5,68)
fun b ->
  if f b = b
  then (b , true)
  else (f b , false)
LamG (IteG EmptyG EmptyG EmptyG)

(5,57)-(5,58)
(b , true)
TupleG (fromList [VarG,LitG])

(5,64)-(5,67)
(f b , false)
TupleG (fromList [AppG (fromList [EmptyG]),LitG])

(5,72)-(5,73)
f'
VarG

*)
