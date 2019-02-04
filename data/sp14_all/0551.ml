
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b then ((failwith "asd"), true) else failwith "asd"), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then fun b''  -> ((f b), false)
      else (fun b''  -> ((f b), true))), b);;

*)

(* changed spans
(6,24)-(6,48)
fun b'' -> (f b , false)
LamG (TupleG (fromList [EmptyG]))

(6,26)-(6,34)
EMPTY
EmptyG

(6,35)-(6,40)
EMPTY
EmptyG

(6,43)-(6,47)
f
VarG

(6,54)-(6,62)
EMPTY
EmptyG

(6,54)-(6,68)
fun b'' -> (f b , true)
LamG (TupleG (fromList [EmptyG]))

(6,63)-(6,68)
f
VarG

*)
