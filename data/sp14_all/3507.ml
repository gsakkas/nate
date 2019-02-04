
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let x = not f in ((x, ((f b) = b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(6,28)-(6,68)
EMPTY
EmptyG

(6,37)-(6,40)
EMPTY
EmptyG

(6,37)-(6,42)
EMPTY
EmptyG

(6,41)-(6,42)
let func =
  fun x ->
    fun x -> (0 , true) in
(func b , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(6,46)-(6,67)
fun x -> fun x -> (0 , true)
LamG (LamG EmptyG)

(6,47)-(6,63)
true
LitG

(6,48)-(6,49)
EMPTY
EmptyG

(6,51)-(6,62)
EMPTY
EmptyG

(6,53)-(6,54)
EMPTY
EmptyG

(6,55)-(6,56)
func
VarG

*)
