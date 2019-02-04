
let pipe fs = let f a x x = x a in let base f = f in List.fold_left f base fs;;


(* fix

let f a x x a = a x;;

let pipe fs =
  let f a x g = f a x in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(2,9)-(2,77)
EMPTY
EmptyG

(2,14)-(2,77)
EMPTY
EmptyG

(2,28)-(2,29)
a
VarG

(2,28)-(2,31)
fun a -> a x
LamG (AppG (fromList [EmptyG]))

(2,30)-(2,31)
fun fs ->
  (let f =
     fun a ->
       fun x -> fun g -> f a x in
   let base = fun f -> f in
   List.fold_left f base fs)
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(2,35)-(2,77)
x
VarG

*)
