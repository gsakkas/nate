
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (fun x  -> if x = b then (b, false) else (((f x), true), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((fun x  -> if x = b then (b, false) else ((f x), true)), b);;

*)

(* changed spans
(5,9)-(5,69)
(fun x ->
   if x = b
   then (b , false)
   else (f x , true) , b)
TupleG (fromList [VarG,LamG EmptyG])

(5,51)-(5,64)
EMPTY
EmptyG

*)
