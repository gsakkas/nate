
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) =
  wwhile (fun func  -> fun f  -> fun b  -> ((f, ((f b) <> b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(7,9)-(7,66)
EMPTY
EmptyG

(7,23)-(7,65)
EMPTY
EmptyG

(7,33)-(7,65)
let func =
  fun x ->
    fun x -> (0 , true) in
(func b , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(7,43)-(7,65)
fun x -> fun x -> (0 , true)
LamG (LamG EmptyG)

(7,44)-(7,61)
true
LitG

(7,45)-(7,46)
EMPTY
EmptyG

(7,48)-(7,60)
EMPTY
EmptyG

(7,50)-(7,51)
EMPTY
EmptyG

(7,52)-(7,53)
func
VarG

*)
