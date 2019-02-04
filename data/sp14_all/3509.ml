
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (((not f b) b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(6,28)-(6,46)
let func =
  fun x ->
    fun x -> (0 , true) in
(func b , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(6,29)-(6,42)
(func b , b)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(6,30)-(6,39)
EMPTY
EmptyG

(6,31)-(6,34)
EMPTY
EmptyG

(6,35)-(6,36)
EMPTY
EmptyG

(6,37)-(6,38)
func
VarG

*)
