
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((f (if (f b) = b then 1 else 0)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) =
  wwhile ((let f x = let xx = (x * x) * x in (xx, (xx < 100)) in f), b);;

*)

(* changed spans
(5,29)-(5,61)
EMPTY
EmptyG

(5,30)-(5,31)
EMPTY
EmptyG

(5,32)-(5,60)
EMPTY
EmptyG

(5,36)-(5,41)
let f =
  fun x ->
    (let xx = (x * x) * x in
     (xx , xx < 100)) in
f
LetG NonRec (fromList [LamG EmptyG]) VarG

(5,36)-(5,45)
EMPTY
EmptyG

(5,37)-(5,38)
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 100))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(5,44)-(5,45)
EMPTY
EmptyG

(5,51)-(5,52)
EMPTY
EmptyG

(5,58)-(5,59)
EMPTY
EmptyG

(5,63)-(5,64)
EMPTY
EmptyG

*)