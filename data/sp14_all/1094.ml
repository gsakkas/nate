
let pipe fs =
  let f a x = a = (fun x  -> fun y  -> x (a y)) in
  let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,15)
EMPTY
EmptyG

(3,14)-(3,47)
EMPTY
EmptyG

(3,18)-(3,47)
EMPTY
EmptyG

*)
