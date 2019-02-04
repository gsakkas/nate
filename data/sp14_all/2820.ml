
let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile (if (f b) = b then (f, b));;


(* fix

let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile ((fun b  -> ((f b), ((f b) = b))), b);;

*)

(* changed spans
(6,28)-(6,54)
(fun b -> (f b , f b = b) , b)
TupleG (fromList [VarG,LamG EmptyG])

(6,29)-(6,53)
EMPTY
EmptyG

(6,32)-(6,41)
fun b -> (f b , f b = b)
LamG (TupleG (fromList [EmptyG]))

(6,47)-(6,53)
EMPTY
EmptyG

(6,48)-(6,49)
EMPTY
EmptyG

*)
