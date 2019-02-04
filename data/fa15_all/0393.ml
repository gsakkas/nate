
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = wwhile (f, (f b));;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(4,53)-(4,54)
let funt =
  fun b ->
    if f b
    then (b , true)
    else (b , false) in
wwhile (funt , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(6,21)-(6,27)
(b , false)
TupleG (fromList [VarG,LitG])

(6,28)-(6,38)
EMPTY
EmptyG

(6,29)-(6,30)
(funt , b)
TupleG (fromList [VarG])

(6,33)-(6,34)
wwhile
VarG

*)
