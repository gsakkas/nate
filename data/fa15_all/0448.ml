
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let isFPoint = ((f b) - b) < 0 in
  let rec test x = if isFPoint x then (x, true) else ((test x), false) in
  wwhile (isFPoint, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x = let isFPoint x = ((f x) - x) < 0 in (x, (isFPoint x)) in
  wwhile (gs, b);;

*)

(* changed spans
(4,53)-(4,54)
let gs =
  fun x ->
    (let isFPoint =
       fun x -> (f x - x) < 0 in
     (x , isFPoint x)) in
wwhile (gs , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(4,67)-(4,68)
fun x -> (f x - x) < 0
LamG (BopG EmptyG EmptyG)

(7,21)-(7,22)
EMPTY
EmptyG

(7,26)-(7,27)
EMPTY
EmptyG

(7,31)-(7,32)
EMPTY
EmptyG

(8,2)-(9,22)
EMPTY
EmptyG

(8,15)-(8,70)
EMPTY
EmptyG

(8,19)-(8,70)
EMPTY
EmptyG

(8,22)-(8,30)
EMPTY
EmptyG

(8,22)-(8,32)
EMPTY
EmptyG

(8,38)-(8,47)
EMPTY
EmptyG

(8,39)-(8,40)
x
VarG

(8,42)-(8,46)
0
LitG

(8,55)-(8,59)
isFPoint
VarG

(8,64)-(8,69)
EMPTY
EmptyG

(9,10)-(9,18)
gs
VarG

*)
