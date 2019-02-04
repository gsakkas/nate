
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) =
  wwhile (let func x y = (x, ((x y) <> y)) in ((func f b), b));;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(7,21)-(7,42)
fun x -> (0 , true)
LamG (TupleG (fromList [EmptyG]))

(7,26)-(7,27)
EMPTY
EmptyG

(7,29)-(7,41)
EMPTY
EmptyG

(7,30)-(7,35)
EMPTY
EmptyG

(7,31)-(7,32)
EMPTY
EmptyG

(7,33)-(7,34)
EMPTY
EmptyG

(7,39)-(7,40)
0
LitG

(7,46)-(7,61)
true
LitG

(7,47)-(7,57)
func b
AppG (fromList [VarG])

(7,53)-(7,54)
EMPTY
EmptyG

*)
