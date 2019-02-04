
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((let f2 x = f x in (f, false)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((fun x  -> ((f b), (3 < 4))), b);;

*)

(* changed spans
(5,29)-(5,59)
EMPTY
EmptyG

(5,41)-(5,42)
EMPTY
EmptyG

(5,41)-(5,44)
EMPTY
EmptyG

(5,43)-(5,44)
EMPTY
EmptyG

(5,49)-(5,50)
f b
AppG (fromList [VarG])

(5,52)-(5,57)
EMPTY
EmptyG

*)
