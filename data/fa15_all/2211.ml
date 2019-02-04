
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((f, (not ((f b) = b))) b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((fun x  -> ((f b), (3 < 4))), b);;

*)

(* changed spans
(5,28)-(5,54)
EMPTY
EmptyG

(5,30)-(5,31)
EMPTY
EmptyG

(5,33)-(5,50)
EMPTY
EmptyG

(5,34)-(5,37)
EMPTY
EmptyG

(5,38)-(5,49)
fun x -> (f b , 3 < 4)
LamG (TupleG (fromList [EmptyG]))

(5,39)-(5,44)
(f b , 3 < 4)
TupleG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

(5,47)-(5,48)
3 < 4
BopG LitG LitG

(5,52)-(5,53)
4
LitG

*)
