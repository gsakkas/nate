
let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) = wwhile ((let g x = (f, (b = (f b))) in g), b);;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f b in (ff, (b = ff)) in (n, b));;

*)

(* changed spans
(6,28)-(6,66)
EMPTY
EmptyG

(6,29)-(6,62)
let n =
  fun x ->
    (let ff = f b in
     (ff , b = ff)) in
(n , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(6,40)-(6,56)
EMPTY
EmptyG

(6,41)-(6,42)
EMPTY
EmptyG

(6,44)-(6,55)
EMPTY
EmptyG

(6,45)-(6,46)
let ff = f b in (ff , b = ff)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(6,60)-(6,61)
(ff , b = ff)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(6,64)-(6,65)
b = ff
BopG VarG VarG

*)
