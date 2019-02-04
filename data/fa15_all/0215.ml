
let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) = wwhile (let n b = (f, (b = (f b))) in (n, b));;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f b in (ff, (b = ff)) in (n, b));;

*)

(* changed spans
(6,35)-(6,55)
EMPTY
EmptyG

(6,39)-(6,55)
EMPTY
EmptyG

(6,40)-(6,41)
EMPTY
EmptyG

(6,43)-(6,54)
EMPTY
EmptyG

(6,44)-(6,45)
fun x ->
  (let ff = f b in
   (ff , b = ff))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(6,48)-(6,53)
let ff = f b in (ff , b = ff)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(6,60)-(6,61)
(n , b)
TupleG (fromList [VarG])

*)
