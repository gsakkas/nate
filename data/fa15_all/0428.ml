
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b1 = if (f b1) = b then (b1, b) else (b1, b) in
  wwhile ((funt b), b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let funt x = (2, ((f b) = b)) in wwhile (funt, b);;

*)

(* changed spans
(7,2)-(8,22)
(2 , f b = b)
TupleG (fromList [BopG EmptyG EmptyG,LitG])

(7,11)-(7,55)
EMPTY
EmptyG

(7,16)-(7,55)
fun x -> (2 , f b = b)
LamG (TupleG (fromList [EmptyG]))

(7,22)-(7,24)
EMPTY
EmptyG

(7,35)-(7,42)
EMPTY
EmptyG

(7,36)-(7,38)
EMPTY
EmptyG

(7,48)-(7,55)
EMPTY
EmptyG

(7,49)-(7,51)
EMPTY
EmptyG

(7,53)-(7,54)
EMPTY
EmptyG

(8,10)-(8,18)
EMPTY
EmptyG

(8,20)-(8,21)
EMPTY
EmptyG

*)
