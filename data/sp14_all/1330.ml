
let pipe fs =
  let f a x = (a x) + (x a) in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs y = let f a x = x a in let base = y in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(3,73)
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(3,14)-(3,27)
EMPTY
EmptyG

(3,15)-(3,16)
EMPTY
EmptyG

(3,22)-(3,27)
EMPTY
EmptyG

(3,23)-(3,24)
EMPTY
EmptyG

(3,40)-(3,45)
EMPTY
EmptyG

(3,44)-(3,45)
y
VarG

*)
