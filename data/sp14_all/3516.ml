
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) =
  wwhile
    (let func x y =
       match (x y) = y with | true  -> (x, true) | false  -> (x, false) in
     ((func f b), b));;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(8,16)-(9,71)
EMPTY
EmptyG

(9,7)-(9,71)
EMPTY
EmptyG

(9,13)-(9,18)
EMPTY
EmptyG

(9,13)-(9,22)
EMPTY
EmptyG

(9,14)-(9,15)
EMPTY
EmptyG

(9,16)-(9,17)
EMPTY
EmptyG

(9,21)-(9,22)
fun x -> (0 , true)
LamG (TupleG (fromList [EmptyG]))

(9,40)-(9,41)
0
LitG

(9,62)-(9,63)
EMPTY
EmptyG

(9,65)-(9,70)
EMPTY
EmptyG

(10,5)-(10,20)
EMPTY
EmptyG

(10,6)-(10,16)
func b
AppG (fromList [VarG])

(10,12)-(10,13)
EMPTY
EmptyG

*)
