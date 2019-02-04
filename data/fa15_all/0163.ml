
let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile (fun x  -> ((x, ((f x) = x)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile ((fun x  -> (x, ((f x) = x))), b);;

*)

(* changed spans
(5,28)-(5,61)
EMPTY
EmptyG

(5,40)-(5,56)
fun x -> (x , f x = x)
LamG (TupleG (fromList [EmptyG]))

*)
