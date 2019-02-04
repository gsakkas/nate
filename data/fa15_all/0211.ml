
let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) = wwhile ((f, ((f b) = b)), b);;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f b in (ff, (b = ff)) in (n, b));;

*)

(* changed spans
(6,28)-(6,49)
EMPTY
EmptyG

(6,29)-(6,45)
EMPTY
EmptyG

(6,30)-(6,31)
EMPTY
EmptyG

(6,33)-(6,44)
let n =
  fun x ->
    (let ff = f b in
     (ff , b = ff)) in
(n , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(6,34)-(6,39)
fun x ->
  (let ff = f b in
   (ff , b = ff))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(6,42)-(6,43)
(ff , b = ff)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(6,47)-(6,48)
(n , b)
TupleG (fromList [VarG])

*)
