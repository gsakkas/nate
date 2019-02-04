
let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((), b);;


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

(5,29)-(5,31)
helper (f , b)
AppG (fromList [TupleG (fromList [EmptyG])])

(5,33)-(5,34)
(f , b)
TupleG (fromList [VarG])

*)
