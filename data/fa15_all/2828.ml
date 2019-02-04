
let pipe fs =
  let f a x = a (fun x  -> x) in let base f = f in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,15)
EMPTY
EmptyG

(3,14)-(3,29)
EMPTY
EmptyG

(3,16)-(3,29)
EMPTY
EmptyG

*)
