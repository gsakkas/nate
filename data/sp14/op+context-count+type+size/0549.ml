
let sqsum xs =
  let f a x = match x with | [] -> a | hd::tl -> a + (hd * hd) in
  let base = f 0 xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in
  let base = match xs with | [] -> 0 | hd::tl -> f 0 hd in
  List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,62)
(3,20)-(3,21)
(3,35)-(3,36)
(3,54)-(3,56)
(3,59)-(3,61)
(4,2)-(4,47)
(4,13)-(4,19)
(4,17)-(4,19)
*)

(* type error slice
(4,13)-(4,14)
(4,13)-(4,19)
(4,17)-(4,19)
(4,23)-(4,37)
(4,23)-(4,47)
(4,38)-(4,39)
(4,45)-(4,47)
*)
