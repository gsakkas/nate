
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((not f), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = if (f b) = b then (b, false) else ((f b), true) in
  wwhile (helper, b);;

*)

(* changed spans
(4,21)-(4,27)
f
VarG

(4,21)-(4,40)
let helper =
  fun b ->
    if f b = b
    then (b , false)
    else (f b , true) in
wwhile (helper , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(4,28)-(4,40)
b
VarG

(4,29)-(4,36)
(f b , true)
TupleG (fromList [AppG (fromList [EmptyG]),LitG])

(4,30)-(4,33)
EMPTY
EmptyG

*)
