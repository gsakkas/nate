
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((let g b = (f, ((f b) = b)) in g), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (let g x = let calcfx = f x in (calcfx, (calcfx = x)) in (g, b));;

*)

(* changed spans
(4,28)-(4,66)
EMPTY
EmptyG

(4,36)-(4,56)
EMPTY
EmptyG

(4,40)-(4,56)
EMPTY
EmptyG

(4,41)-(4,42)
EMPTY
EmptyG

(4,44)-(4,55)
fun x ->
  (let calcfx = f x in
   (calcfx , calcfx = x))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(4,45)-(4,50)
let calcfx = f x in
(calcfx , calcfx = x)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(4,48)-(4,49)
EMPTY
EmptyG

(4,53)-(4,54)
x
VarG

(4,60)-(4,61)
(calcfx , calcfx = x)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

*)
