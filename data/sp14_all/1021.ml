
let a = 20;;

let pipe fs =
  let f a x = x in let base p = a p in List.fold_left f base (List.rev fs);;


(* fix

let pipe fs =
  let f a x = x in let base p = p in List.fold_left f base (List.rev fs);;

*)

(* changed spans
(2,8)-(2,10)
EMPTY
EmptyG

(5,32)-(5,33)
EMPTY
EmptyG

(5,32)-(5,35)
EMPTY
EmptyG

*)
