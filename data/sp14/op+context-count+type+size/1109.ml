
let sqsum xs =
  let f a x x = x * x in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = x * x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,2)-(3,65)
(3,12)-(3,21)
(3,25)-(3,65)
*)

(* type error slice
(3,2)-(3,65)
(3,8)-(3,21)
(3,10)-(3,21)
(3,12)-(3,21)
(3,25)-(3,65)
(3,36)-(3,37)
(3,41)-(3,55)
(3,41)-(3,65)
(3,56)-(3,57)
(3,58)-(3,62)
*)
