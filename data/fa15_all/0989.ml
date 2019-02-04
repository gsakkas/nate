
let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile (((f b) = (let rr = f b in (rr, (rr = b)))), b);;


(* fix

let helper (f,b) = let f b = let x = f b in (x, (x != b)) in f;;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;

*)

(* changed spans
(3,2)-(3,72)
fun (f , b) ->
  (let (x , y) = f b in
   match y with
   | false -> x
   | true -> wwhile (f , x))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(5,29)-(5,71)
EMPTY
EmptyG

(5,31)-(5,32)
EMPTY
EmptyG

(5,33)-(5,34)
EMPTY
EmptyG

(5,38)-(5,70)
EMPTY
EmptyG

(5,48)-(5,49)
EMPTY
EmptyG

(5,48)-(5,51)
EMPTY
EmptyG

(5,50)-(5,51)
helper
VarG

(5,56)-(5,58)
EMPTY
EmptyG

(5,60)-(5,68)
EMPTY
EmptyG

(5,61)-(5,63)
f
VarG

*)
