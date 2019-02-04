
let pipe fs =
  let f a x a = (x a) + x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs y = let f a x = x a in let base = y in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(3,71)
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(3,12)-(3,25)
EMPTY
EmptyG

(3,16)-(3,25)
EMPTY
EmptyG

(3,24)-(3,25)
EMPTY
EmptyG

(3,38)-(3,43)
EMPTY
EmptyG

(3,42)-(3,43)
y
VarG

*)
