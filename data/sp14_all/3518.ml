
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x y x y = (y, true) in ((func f b), b));;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(6,40)-(6,57)
EMPTY
EmptyG

(6,44)-(6,57)
EMPTY
EmptyG

(6,49)-(6,50)
0
LitG

(6,62)-(6,72)
func b
AppG (fromList [VarG])

(6,68)-(6,69)
EMPTY
EmptyG

*)
