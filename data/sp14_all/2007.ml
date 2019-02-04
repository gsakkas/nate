
let pipe fs =
  let f a x = x a in let base a = fs a in List.fold_left f base fs;;


(* fix

let pipe fs p = let f a x = x a in let base = p in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(3,66)
fun p ->
  (let f =
     fun a -> fun x -> x a in
   let base = p in
   List.fold_left f base fs)
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(3,30)-(3,38)
EMPTY
EmptyG

(3,34)-(3,36)
EMPTY
EmptyG

(3,34)-(3,38)
EMPTY
EmptyG

(3,37)-(3,38)
p
VarG

*)
