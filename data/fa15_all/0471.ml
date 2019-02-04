
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let isFPoint s = ((f s) - s) < 0 in
  let iterate (t,y) = t y in
  let rec go r = if isFPoint r then r else go (iterate (f, r)) in
  wwhile ((go, true), b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x = let isFPoint s = ((f s) - s) < 0 in ((f x), (isFPoint x)) in
  wwhile (gs, b);;

*)

(* changed spans
(4,53)-(4,54)
let gs =
  fun x ->
    (let isFPoint =
       fun s -> (f s - s) < 0 in
     (f x , isFPoint x)) in
wwhile (gs , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(8,2)-(10,24)
EMPTY
EmptyG

(8,15)-(8,25)
(f x , isFPoint x)
TupleG (fromList [AppG (fromList [EmptyG])])

(8,22)-(8,23)
EMPTY
EmptyG

(8,24)-(8,25)
EMPTY
EmptyG

(9,2)-(10,24)
x
VarG

(9,13)-(9,62)
EMPTY
EmptyG

(9,17)-(9,62)
f
VarG

(9,29)-(9,30)
EMPTY
EmptyG

(9,36)-(9,37)
EMPTY
EmptyG

(9,43)-(9,45)
EMPTY
EmptyG

(9,43)-(9,62)
EMPTY
EmptyG

(9,46)-(9,62)
EMPTY
EmptyG

(9,47)-(9,54)
EMPTY
EmptyG

(9,55)-(9,61)
EMPTY
EmptyG

(9,56)-(9,57)
EMPTY
EmptyG

(9,59)-(9,60)
x
VarG

(10,10)-(10,20)
EMPTY
EmptyG

(10,11)-(10,13)
EMPTY
EmptyG

(10,15)-(10,19)
gs
VarG

*)
