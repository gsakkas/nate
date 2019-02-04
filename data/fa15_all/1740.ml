
let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) =
  wwhile (let f' (f,b) = ((f b), (b == (f b))) in ((f' (f, b)), b));;


(* fix

let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let f' b = ((f b), (b = (f b))) in f'), b);;

*)

(* changed spans
(6,9)-(6,67)
(let f' =
   fun b -> (f b , b = f b) in
 f' , b)
TupleG (fromList [VarG,LetG NonRec (fromList [EmptyG]) EmptyG])

(6,18)-(6,46)
fun b -> (f b , b = f b)
LamG (TupleG (fromList [EmptyG]))

(6,50)-(6,66)
EMPTY
EmptyG

(6,51)-(6,62)
EMPTY
EmptyG

(6,55)-(6,61)
EMPTY
EmptyG

(6,56)-(6,57)
EMPTY
EmptyG

(6,64)-(6,65)
EMPTY
EmptyG

*)
