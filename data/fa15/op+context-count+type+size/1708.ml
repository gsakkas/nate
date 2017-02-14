
let pipe fs num =
  let f a x = match x with | [] -> (fun d  -> a) | h::t -> h in
  let base = num in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base i = i in List.fold_left f base fs;;

*)

(* changed spans
(2,12)-(4,44)
(3,14)-(3,60)
(3,20)-(3,21)
(3,35)-(3,48)
(3,59)-(3,60)
(4,2)-(4,44)
(4,13)-(4,16)
(4,20)-(4,44)
*)

(* type error slice
(3,2)-(4,44)
(3,8)-(3,60)
(3,10)-(3,60)
(3,14)-(3,60)
(3,35)-(3,48)
(3,46)-(3,47)
(4,20)-(4,34)
(4,20)-(4,44)
(4,35)-(4,36)
*)
