
let sqsum xs = let f a x = x * x in let base = 0 in List.fold_right f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(2,15)-(2,77)
(2,27)-(2,32)
(2,36)-(2,77)
(2,52)-(2,67)
*)

(* type error slice
(2,36)-(2,77)
(2,47)-(2,48)
(2,52)-(2,67)
(2,52)-(2,77)
(2,70)-(2,74)
*)
