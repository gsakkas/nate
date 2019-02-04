
let f' f b = (f b) = b;;

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) = wwhile ((f' f b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' b = if (f b) = b then (b, true) else ((f b), false) in f'), b);;

*)

(* changed spans
(2,7)-(2,22)
EMPTY
EmptyG

(2,9)-(2,22)
EMPTY
EmptyG

(2,13)-(2,18)
EMPTY
EmptyG

(2,13)-(2,22)
EMPTY
EmptyG

(2,14)-(2,15)
EMPTY
EmptyG

(2,16)-(2,17)
EMPTY
EmptyG

(2,21)-(2,22)
EMPTY
EmptyG

(7,29)-(7,37)
EMPTY
EmptyG

(7,30)-(7,32)
let f' =
  fun b ->
    if f b = b
    then (b , true)
    else (f b , false) in
f'
LetG NonRec (fromList [LamG EmptyG]) VarG

(7,33)-(7,34)
fun b ->
  if f b = b
  then (b , true)
  else (f b , false)
LamG (IteG EmptyG EmptyG EmptyG)

*)
