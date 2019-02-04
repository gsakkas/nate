
let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) = wwhile ((f, b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' b = if (f b) = b then (b, true) else ((f b), false) in f'), b);;

*)

(* changed spans
(5,29)-(5,35)
let f' =
  fun b ->
    if f b = b
    then (b , true)
    else (f b , false) in
f'
LetG NonRec (fromList [LamG EmptyG]) VarG

(5,30)-(5,31)
(f b , false)
TupleG (fromList [AppG (fromList [EmptyG]),LitG])

(5,37)-(5,38)
f'
VarG

*)
