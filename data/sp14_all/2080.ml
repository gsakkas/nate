
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = ((wwhile (b = (f b))), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> let xx = f x in (xx, (xx != b))), b);;

*)

(* changed spans
(4,21)-(4,46)
EMPTY
EmptyG

(4,30)-(4,41)
EMPTY
EmptyG

(4,31)-(4,32)
(fun x ->
   (let xx = f x in
    (xx , xx <> b)) , b)
TupleG (fromList [VarG,LamG EmptyG])

(4,35)-(4,40)
fun x ->
  (let xx = f x in
   (xx , xx <> b))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(4,38)-(4,39)
(xx , xx <> b)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

*)
