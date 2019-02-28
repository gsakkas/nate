
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let isFPoint x = ((f x) - x) < 0 in
  let rec test x = if isFPoint x then (x, true) else ((test (f b)), false) in
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

(8,2)-(9,22)
EMPTY
EmptyG

(8,42)-(8,46)
EMPTY
EmptyG

(8,55)-(8,59)
isFPoint
VarG

(8,61)-(8,62)
x
VarG

(9,10)-(9,18)
gs
VarG

*)

(* typed spans
(7,2)-(8,16)
(7,54)-(7,62)
(7,63)-(7,64)
(8,10)-(8,12)
*)

(* typed spans
int
int -> bool
int
int -> (int * bool)
*)

(* typed spans
int
int -> int
int -> int
int -> bool
*)
