
let helper (x,r) = let m = x r in match m with | r -> (r, false);;

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
(2,12)-(2,64)
EMPTY
EmptyG

(2,19)-(2,64)
fun (f , b) ->
  (let f =
     fun b ->
       (let x = f b in
        (x , x <> b)) in
   f)
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(2,27)-(2,28)
EMPTY
EmptyG

(2,27)-(2,30)
let f =
  fun b ->
    (let x = f b in
     (x , x <> b)) in
f
LetG NonRec (fromList [LamG EmptyG]) VarG

(2,29)-(2,30)
EMPTY
EmptyG

(2,34)-(2,64)
EMPTY
EmptyG

(2,40)-(2,41)
f
VarG

(2,54)-(2,64)
b
VarG

(2,55)-(2,56)
EMPTY
EmptyG

(2,58)-(2,63)
x
VarG

(4,16)-(5,72)
x <> b
BopG VarG VarG

*)
