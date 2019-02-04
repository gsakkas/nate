
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (f, (f b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) =
  wwhile ((let f x = let xx = (x * x) * x in (xx, (xx < 100)) in f), b);;

*)

(* changed spans
(5,29)-(5,30)
EMPTY
EmptyG

(5,32)-(5,37)
let f =
  fun x ->
    (let xx = (x * x) * x in
     (xx , xx < 100)) in
f
LetG NonRec (fromList [LamG EmptyG]) VarG

(5,33)-(5,34)
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 100))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

*)
