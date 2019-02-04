
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((if (f b) = b then b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) =
  wwhile ((let f x = let xx = (x * x) * x in (xx, (xx < 100)) in f), b);;

*)

(* changed spans
(5,29)-(5,50)
EMPTY
EmptyG

(5,30)-(5,49)
EMPTY
EmptyG

(5,33)-(5,38)
let f =
  fun x ->
    (let xx = (x * x) * x in
     (xx , xx < 100)) in
f
LetG NonRec (fromList [LamG EmptyG]) VarG

(5,33)-(5,42)
EMPTY
EmptyG

(5,34)-(5,35)
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 100))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(5,41)-(5,42)
EMPTY
EmptyG

(5,48)-(5,49)
EMPTY
EmptyG

(5,52)-(5,53)
EMPTY
EmptyG

*)
