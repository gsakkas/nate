
let pipe fs = let f a x = fs in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun n  -> n) a in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(2,14)-(2,72)
(2,26)-(2,28)
(2,32)-(2,72)
(2,43)-(2,44)
(2,48)-(2,72)
*)

(* type error slice
(2,14)-(2,72)
(2,20)-(2,28)
(2,22)-(2,28)
(2,26)-(2,28)
(2,32)-(2,72)
(2,43)-(2,44)
(2,48)-(2,62)
(2,48)-(2,72)
(2,63)-(2,64)
(2,65)-(2,69)
(2,70)-(2,72)
*)
