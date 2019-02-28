
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((fun x  -> ((f x), ((not f b) = b))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((fun x  -> ((f x), (not ((f b) = b)))), b);;

*)

(* changed spans
(5,48)-(5,63)
EMPTY
EmptyG

(5,49)-(5,58)
not (f b = b)
AppG (fromList [BopG EmptyG EmptyG])

(5,54)-(5,55)
f b = b
BopG (AppG (fromList [EmptyG])) VarG

*)

(* typed spans
bool
bool
*)
