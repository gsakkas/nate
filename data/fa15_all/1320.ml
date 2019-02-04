
let pipe fs =
  let f a x f' = f' (x a) in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x f' = x (a f') in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,17)-(3,19)
EMPTY
EmptyG

(3,20)-(3,25)
EMPTY
EmptyG

(3,23)-(3,24)
a f'
AppG (fromList [VarG])

(3,29)-(3,71)
f'
VarG

*)
