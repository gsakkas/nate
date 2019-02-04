
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((if (f b) = b then (b, (failwith "asd")) else failwith "asd"), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then fun b''  -> ((f b), false)
      else (fun b''  -> ((f b), true))), b);;

*)

(* changed spans
(5,29)-(5,50)
fun b'' -> (f b , false)
LamG (TupleG (fromList [EmptyG]))

(5,30)-(5,31)
EMPTY
EmptyG

(5,34)-(5,42)
EMPTY
EmptyG

(5,43)-(5,48)
f
VarG

(5,56)-(5,64)
EMPTY
EmptyG

(5,56)-(5,70)
fun b'' -> (f b , true)
LamG (TupleG (fromList [EmptyG]))

(5,65)-(5,70)
f
VarG

*)
