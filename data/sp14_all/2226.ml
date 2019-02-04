
let rec wwhile (f,b) =
  match f b with | (b',true ) -> wwhile (f, b') | (b',false ) -> b';;

let fixpoint (f,b) =
  let (b',c) = ((f b), ((f b) <> b)) in wwhile ((b', c), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',true ) -> wwhile (f, b') | (b',false ) -> b';;

let fixpoint (f,b) =
  let f b = let b' = f b in (b', ((f b) <> b)) in wwhile (f, b);;

*)

(* changed spans
(6,2)-(6,59)
EMPTY
EmptyG

(6,15)-(6,36)
let f =
  fun b ->
    (let b' = f b in
     (b' , f b <> b)) in
wwhile (f , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(6,16)-(6,21)
fun b ->
  (let b' = f b in
   (b' , f b <> b))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(6,23)-(6,35)
(b' , f b <> b)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(6,48)-(6,55)
EMPTY
EmptyG

(6,49)-(6,51)
EMPTY
EmptyG

(6,53)-(6,54)
f
VarG

*)
