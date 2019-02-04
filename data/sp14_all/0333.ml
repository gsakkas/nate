
let rec wwhile (f,b) =
  match f b with | (i,true ) -> wwhile (f, i) | (i,false ) -> i;;

let fixpoint (f,b) =
  wwhile (fun x  -> if x = (f x) then (x, false) else (((f x), true), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (i,true ) -> wwhile (f, i) | (i,false ) -> i;;

let fixpoint (f,b) =
  wwhile ((fun x  -> if x = (f x) then (x, false) else ((f x), true)), b);;

*)

(* changed spans
(6,9)-(6,73)
(fun x ->
   if x = f x
   then (x , false)
   else (f x , true) , b)
TupleG (fromList [VarG,LamG EmptyG])

(6,55)-(6,68)
EMPTY
EmptyG

*)
