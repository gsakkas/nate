
let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (let h x y = ((y x), false) in ((h b f), b));;


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

(5,28)-(5,72)
EMPTY
EmptyG

(5,35)-(5,55)
EMPTY
EmptyG

(5,37)-(5,55)
EMPTY
EmptyG

(5,42)-(5,47)
EMPTY
EmptyG

(5,43)-(5,44)
EMPTY
EmptyG

(5,45)-(5,46)
EMPTY
EmptyG

(5,49)-(5,54)
EMPTY
EmptyG

(5,59)-(5,71)
EMPTY
EmptyG

(5,60)-(5,67)
EMPTY
EmptyG

(5,65)-(5,66)
EMPTY
EmptyG

(5,69)-(5,70)
EMPTY
EmptyG

*)
