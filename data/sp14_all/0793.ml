
let rec wwhile (f,b) =
  match f b with
  | (x,trueOrFalse) -> if trueOrFalse then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((), b);;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (x,trueOrFalse) -> if trueOrFalse then wwhile (f, x) else x;;

let fixpoint (f,b) =
  wwhile
    ((fun x  -> let xi = f x in (xi, (((f xi) != xi) || (f (f xi))))), b);;

*)

(* changed spans
(6,29)-(6,31)
fun x ->
  (let xi = f x in
   (xi , (f xi <> xi) || f (f xi)))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(6,33)-(6,34)
let xi = f x in
(xi , (f xi <> xi) || f (f xi))
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

*)
