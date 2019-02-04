
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    (let fin (f',b') = let nfb = f' b' in (nfb, (nfb = b')) in
     ((fin (f, b)), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let fin bt = (bt, ((f bt) = bt)) in (fin, b));;

*)

(* changed spans
(6,14)-(6,59)
EMPTY
EmptyG

(6,23)-(6,59)
EMPTY
EmptyG

(6,33)-(6,35)
EMPTY
EmptyG

(6,33)-(6,38)
EMPTY
EmptyG

(6,36)-(6,38)
fun bt -> (bt , f bt = bt)
LamG (TupleG (fromList [EmptyG]))

(6,43)-(6,46)
bt
VarG

(6,49)-(6,52)
EMPTY
EmptyG

(6,55)-(6,57)
EMPTY
EmptyG

(7,5)-(7,22)
EMPTY
EmptyG

(7,7)-(7,10)
EMPTY
EmptyG

(7,11)-(7,17)
EMPTY
EmptyG

(7,15)-(7,16)
bt
VarG

(7,20)-(7,21)
(fin , b)
TupleG (fromList [VarG])

*)
