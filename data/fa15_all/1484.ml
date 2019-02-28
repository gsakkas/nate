
let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) = wwhile (if (f b) = true then b else ((f f b), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let t = f b in if b = t then (b, false) else (t, true) in g),
      b);;

*)

(* changed spans
(5,28)-(5,70)
EMPTY
EmptyG

(5,32)-(5,37)
let g =
  fun b ->
    (let t = f b in
     if b = t
     then (b , false)
     else (t , true)) in
g
LetG NonRec (fromList [LamG EmptyG]) VarG

(5,32)-(5,44)
(let g =
   fun b ->
     (let t = f b in
      if b = t
      then (b , false)
      else (t , true)) in
 g , b)
TupleG (fromList [VarG,LetG NonRec (fromList [EmptyG]) EmptyG])

(5,40)-(5,44)
if b = t
then (b , false)
else (t , true)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(5,50)-(5,51)
b = t
BopG VarG VarG

(5,57)-(5,69)
t
VarG

(5,58)-(5,65)
EMPTY
EmptyG

(5,59)-(5,60)
EMPTY
EmptyG

(5,61)-(5,62)
EMPTY
EmptyG

(5,67)-(5,68)
(t , true)
TupleG (fromList [VarG,LitG])

*)

(* typed spans
't31 -> ('t31 * bool)
('t31 -> ('t31 * bool) * 't31)
('t31 * bool)
bool
't31
('t31 * bool)
*)
