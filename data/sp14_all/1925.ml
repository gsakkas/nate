
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = wwhile ((let f b = b in b), b);;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let g b = (b, (f b)) in wwhile (g, b);;

*)

(* changed spans
(7,21)-(7,27)
EMPTY
EmptyG

(7,21)-(7,51)
EMPTY
EmptyG

(7,28)-(7,51)
EMPTY
EmptyG

(7,29)-(7,47)
let g = fun b -> (b , f b) in
wwhile (g , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(7,40)-(7,41)
(b , f b)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(7,45)-(7,46)
f b
AppG (fromList [VarG])

(7,49)-(7,50)
wwhile (g , b)
AppG (fromList [TupleG (fromList [EmptyG])])

*)
