
let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (let g x = x in (((g (f b)), false), b));;


(* fix

let h x = ((x * x), (x < 100));;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(2,16)-(3,62)
fun x -> (x * x , x < 100)
LamG (TupleG (fromList [EmptyG]))

(5,28)-(5,68)
EMPTY
EmptyG

(5,35)-(5,40)
EMPTY
EmptyG

(5,39)-(5,40)
EMPTY
EmptyG

(5,45)-(5,63)
EMPTY
EmptyG

(5,46)-(5,55)
EMPTY
EmptyG

(5,47)-(5,48)
EMPTY
EmptyG

(5,49)-(5,54)
EMPTY
EmptyG

(5,50)-(5,51)
EMPTY
EmptyG

(5,52)-(5,53)
EMPTY
EmptyG

(5,57)-(5,62)
h
VarG

*)
