
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (fun x  -> if (f x) = x then (b, false) else (((f x), true), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((fun x  -> if x = b then (b, false) else ((f x), true)), b);;

*)

(* changed spans
(5,9)-(5,73)
(fun x ->
   if x = b
   then (b , false)
   else (f x , true) , b)
TupleG (fromList [VarG,LamG EmptyG])

(5,23)-(5,28)
EMPTY
EmptyG

(5,24)-(5,25)
EMPTY
EmptyG

(5,31)-(5,32)
b
VarG

(5,55)-(5,68)
EMPTY
EmptyG

*)
