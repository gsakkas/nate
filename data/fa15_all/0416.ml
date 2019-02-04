
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = wwhile ((f, ((f b) = b)), b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(6,21)-(6,27)
EMPTY
EmptyG

(6,21)-(6,49)
EMPTY
EmptyG

(6,28)-(6,49)
EMPTY
EmptyG

(6,29)-(6,45)
fun b ->
  if f b
  then (b , true)
  else (b , false)
LamG (IteG EmptyG EmptyG EmptyG)

(6,30)-(6,31)
EMPTY
EmptyG

(6,33)-(6,44)
let funt =
  fun b ->
    if f b
    then (b , true)
    else (b , false) in
wwhile (funt , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(6,34)-(6,39)
(b , true)
TupleG (fromList [VarG,LitG])

(6,35)-(6,36)
(b , false)
TupleG (fromList [VarG,LitG])

(6,37)-(6,38)
wwhile (funt , b)
AppG (fromList [TupleG (fromList [EmptyG])])

*)
