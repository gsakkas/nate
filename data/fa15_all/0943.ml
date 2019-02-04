
let pipe fs = let f a x = x a in let base = fs 0 in List.fold_left f base fs;;


(* fix

let pipe fs z = let f a x = x a in let base = z in List.fold_left f base fs;;

*)

(* changed spans
(2,14)-(2,76)
fun z ->
  (let f =
     fun a -> fun x -> x a in
   let base = z in
   List.fold_left f base fs)
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(2,44)-(2,46)
EMPTY
EmptyG

(2,44)-(2,48)
EMPTY
EmptyG

(2,47)-(2,48)
z
VarG

*)
