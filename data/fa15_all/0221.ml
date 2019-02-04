
let fu x b = (x, (b < (x b)));;

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) = wwhile ((fu f), b);;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f b in (ff, (b = ff)) in (n, b));;

*)

(* changed spans
(2,7)-(2,29)
EMPTY
EmptyG

(2,9)-(2,29)
EMPTY
EmptyG

(2,13)-(2,29)
EMPTY
EmptyG

(2,14)-(2,15)
EMPTY
EmptyG

(2,17)-(2,28)
EMPTY
EmptyG

(2,18)-(2,19)
EMPTY
EmptyG

(2,22)-(2,27)
EMPTY
EmptyG

(2,23)-(2,24)
EMPTY
EmptyG

(2,25)-(2,26)
EMPTY
EmptyG

(8,28)-(8,39)
let n =
  fun x ->
    (let ff = f b in
     (ff , b = ff)) in
(n , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(8,29)-(8,35)
fun x ->
  (let ff = f b in
   (ff , b = ff))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(8,30)-(8,32)
EMPTY
EmptyG

*)
