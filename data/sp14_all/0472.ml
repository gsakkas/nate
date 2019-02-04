
let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (x,true ) -> wwhile (f, x);;

let fixpoint (f,b) = wwhile (((f b), (b = (f b))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (x,true ) -> wwhile (f, x);;

let fixpoint (f,b) =
  wwhile (let g x = let bb = f b in (bb, (bb = b)) in (g, b));;

*)

(* changed spans
(5,28)-(5,53)
EMPTY
EmptyG

(5,29)-(5,49)
let g =
  fun x ->
    (let bb = f b in
     (bb , bb = b)) in
(g , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(5,30)-(5,35)
fun x ->
  (let bb = f b in
   (bb , bb = b))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(5,37)-(5,48)
(bb , bb = b)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(5,38)-(5,39)
EMPTY
EmptyG

(5,42)-(5,47)
EMPTY
EmptyG

(5,43)-(5,44)
bb
VarG

(5,51)-(5,52)
(g , b)
TupleG (fromList [VarG])

*)
