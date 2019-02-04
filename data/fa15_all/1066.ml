
let pipe fs = let f a x x a = x in let base x = x in List.fold_left f base fs;;


(* fix

let f a x = (a * a) + x;;

let pipe fs =
  let f a x x a = f a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,9)-(2,77)
fun a -> fun x -> (a * a) + x
LamG (LamG EmptyG)

(2,30)-(2,31)
f a
AppG (fromList [VarG])

(2,35)-(2,77)
a
VarG

*)
