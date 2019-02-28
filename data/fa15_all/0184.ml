
let rec wwhile (f,b) =
  let (x,y) = f b in if y = false then x else wwhile (f, x);;

let fixpoint (f,b) = wwhile ((wwhile (f, b)), b);;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) =
  wwhile (let g b = ((f b), (if (f b) = b then false else true)) in (g, b));;

*)

(* changed spans
(3,24)-(3,33)
EMPTY
EmptyG

(3,28)-(3,33)
EMPTY
EmptyG

(3,39)-(3,40)
EMPTY
EmptyG

(5,14)-(5,48)
x
VarG

(5,28)-(5,48)
let g =
  fun b ->
    (f b , if f b = b
           then false
           else true) in
(g , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(5,30)-(5,36)
EMPTY
EmptyG

(5,37)-(5,43)
EMPTY
EmptyG

(5,46)-(5,47)
if f b = b
then false
else true
IteG (BopG EmptyG EmptyG) LitG LitG

*)

(* typed spans
't27
('t27 -> ('t27 * bool) * 't27)
bool
*)
