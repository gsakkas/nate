
let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile (((f b), ((not f b) = b)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile ((fun x  -> (x, ((f x) = x))), b);;

*)

(* changed spans
(5,29)-(5,53)
fun x -> (x , f x = x)
LamG (TupleG (fromList [EmptyG]))

(5,30)-(5,35)
x
VarG

(5,38)-(5,47)
f x
AppG (fromList [VarG])

(5,45)-(5,46)
x
VarG

(5,55)-(5,56)
x
VarG

*)

(* typed spans
(5,29)-(5,57)
(5,41)-(5,42)
(5,45)-(5,50)
(5,48)-(5,49)
(5,53)-(5,54)
*)

(* typed spans
'a -> ('a * bool)
'a
'a
'a
'a
*)

(* typed spans
('a * bool)
'a
'a
'a
'a
*)
