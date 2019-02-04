
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = (((f b) = b), (f b)) in wwhile ((helper b), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = let fb = f b in if fb = b then (true, fb) else (false, fb) in
  wwhile (helper, b);;

*)

(* changed spans
(5,17)-(5,37)
EMPTY
EmptyG

(5,18)-(5,29)
let fb = f b in
if fb = b
then (true , fb)
else (false , fb)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (IteG EmptyG EmptyG EmptyG)

(5,27)-(5,28)
EMPTY
EmptyG

(5,31)-(5,36)
EMPTY
EmptyG

(5,32)-(5,33)
if fb = b
then (true , fb)
else (false , fb)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(5,34)-(5,35)
fb = b
BopG VarG VarG

(5,41)-(5,63)
(false , fb)
TupleG (fromList [VarG,LitG])

(5,49)-(5,59)
EMPTY
EmptyG

(5,61)-(5,62)
EMPTY
EmptyG

*)
