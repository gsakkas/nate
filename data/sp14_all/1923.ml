
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) =
  let f x = let xx = f x in (xx, (xx != b)) in f wwhile (f, b);;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let g b = (b, (f b)) in wwhile (g, b);;

*)

(* changed spans
(8,2)-(8,62)
EMPTY
EmptyG

(8,8)-(8,43)
EMPTY
EmptyG

(8,12)-(8,43)
EMPTY
EmptyG

(8,21)-(8,22)
EMPTY
EmptyG

(8,21)-(8,24)
EMPTY
EmptyG

(8,23)-(8,24)
let g = fun b -> (b , f b) in
wwhile (g , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(8,28)-(8,43)
fun b -> (b , f b)
LamG (TupleG (fromList [EmptyG]))

(8,29)-(8,31)
EMPTY
EmptyG

(8,33)-(8,42)
EMPTY
EmptyG

(8,34)-(8,36)
EMPTY
EmptyG

(8,47)-(8,62)
f b
AppG (fromList [VarG])

(8,49)-(8,55)
wwhile (g , b)
AppG (fromList [TupleG (fromList [EmptyG])])

(8,57)-(8,58)
g
VarG

*)
