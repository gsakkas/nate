
let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((b, false), b);;


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

(5,29)-(5,39)
EMPTY
EmptyG

(5,30)-(5,31)
EMPTY
EmptyG

(5,33)-(5,38)
h
VarG

*)