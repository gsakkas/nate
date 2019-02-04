
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if (f b) = b then (b, b) else (b, b) in wwhile ((funt b), b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let funt x = (2, ((f b) = b)) in wwhile (funt, b);;

*)

(* changed spans
(7,2)-(7,75)
(2 , f b = b)
TupleG (fromList [BopG EmptyG EmptyG,LitG])

(7,11)-(7,51)
EMPTY
EmptyG

(7,15)-(7,51)
fun x -> (2 , f b = b)
LamG (TupleG (fromList [EmptyG]))

(7,33)-(7,39)
EMPTY
EmptyG

(7,34)-(7,35)
EMPTY
EmptyG

(7,37)-(7,38)
EMPTY
EmptyG

(7,45)-(7,51)
EMPTY
EmptyG

(7,46)-(7,47)
EMPTY
EmptyG

(7,49)-(7,50)
EMPTY
EmptyG

(7,63)-(7,71)
EMPTY
EmptyG

(7,73)-(7,74)
EMPTY
EmptyG

*)
