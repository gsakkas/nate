
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then ((failwith "Asd"), (failwith "asd"))
      else failwith "asd"), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then fun b''  -> ((f b), false)
      else (fun b''  -> ((f b), true))), b);;

*)

(* changed spans
(7,11)-(7,47)
fun b'' -> (f b , false)
LamG (TupleG (fromList [EmptyG]))

(7,13)-(7,21)
EMPTY
EmptyG

(7,22)-(7,27)
EMPTY
EmptyG

(7,30)-(7,46)
EMPTY
EmptyG

(7,31)-(7,39)
EMPTY
EmptyG

(7,40)-(7,45)
f
VarG

(8,11)-(8,19)
EMPTY
EmptyG

(8,11)-(8,25)
fun b'' -> (f b , true)
LamG (TupleG (fromList [EmptyG]))

(8,20)-(8,25)
f
VarG

*)
