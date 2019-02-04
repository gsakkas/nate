
let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) = wwhile (if f = true then b else ((f b), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let t = f b in if b = t then (b, false) else (t, true) in g),
      b);;

*)

(* changed spans
(5,28)-(5,64)
(let g =
   fun b ->
     (let t = f b in
      if b = t
      then (b , false)
      else (t , true)) in
 g , b)
TupleG (fromList [VarG,LetG NonRec (fromList [EmptyG]) EmptyG])

(5,32)-(5,33)
EMPTY
EmptyG

(5,36)-(5,40)
EMPTY
EmptyG

(5,53)-(5,63)
t
VarG

(5,54)-(5,59)
EMPTY
EmptyG

(5,55)-(5,56)
EMPTY
EmptyG

(5,61)-(5,62)
(t , true)
TupleG (fromList [VarG,LitG])

*)
