
let pipe fs =
  let f a x = x (a a) in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs y = let f a x = x a in let base = y in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(3,67)
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(3,16)-(3,21)
EMPTY
EmptyG

(3,19)-(3,20)
EMPTY
EmptyG

(3,34)-(3,39)
EMPTY
EmptyG

*)
