
let helper x r = let m = x r in match m with | r -> (r, false);;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;


(* fix

let helper (f,b) = let f b = let x = f b in (x, (x != b)) in f;;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;

*)

(* changed spans
(2,11)-(2,62)
EMPTY
EmptyG

(2,13)-(2,62)
EMPTY
EmptyG

(2,17)-(2,62)
fun (f , b) ->
  (let f =
     fun b ->
       (let x = f b in
        (x , x <> b)) in
   f)
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(2,25)-(2,26)
EMPTY
EmptyG

(2,25)-(2,28)
let f =
  fun b ->
    (let x = f b in
     (x , x <> b)) in
f
LetG NonRec (fromList [LamG EmptyG]) VarG

(2,27)-(2,28)
EMPTY
EmptyG

(2,32)-(2,62)
EMPTY
EmptyG

(2,38)-(2,39)
f
VarG

(2,52)-(2,62)
b
VarG

(2,53)-(2,54)
EMPTY
EmptyG

(2,56)-(2,61)
x
VarG

(4,16)-(5,72)
x <> b
BopG VarG VarG

*)
