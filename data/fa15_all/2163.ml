
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = ((wwhile (fun x  -> ((wwhile (f, b)), (b = (f b))))), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> ((f x), (b = (f b)))), b);;

*)

(* changed spans
(5,21)-(5,77)
EMPTY
EmptyG

(5,30)-(5,72)
(fun x -> (f x , b = f b) , b)
TupleG (fromList [VarG,LamG EmptyG])

(5,43)-(5,49)
EMPTY
EmptyG

(5,54)-(5,55)
x
VarG

*)

(* typed spans
(5,28)-(5,65)
(5,44)-(5,45)
*)

(* typed spans
('a -> ('a * bool) * 'a)
'a
*)

(* typed spans
'a -> ('b * bool)
'a
*)
