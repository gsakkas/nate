
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let isFPoint s = ((f s) - s) < 0 in
  let iterate (t,y) = t y in
  let rec go r = if isFPoint r then r else go (iterate (f, r)) in
  wwhile (go, b);;


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

(8,2)-(10,16)
(f x , isFPoint x)
TupleG (fromList [AppG (fromList [EmptyG])])

(8,22)-(8,23)
f
VarG

(9,2)-(10,16)
x
VarG

(9,29)-(9,30)
x
VarG

(10,10)-(10,12)
gs
VarG

*)

(* typed spans
(7,2)-(8,16)
(7,49)-(7,70)
(7,51)-(7,52)
(7,53)-(7,54)
(7,67)-(7,68)
(8,10)-(8,12)
*)

(* typed spans
int
(int * bool)
int -> int
int
int
int -> (int * bool)
*)

(* typed spans
int
'a
int -> int
'a
int
int -> int
*)
