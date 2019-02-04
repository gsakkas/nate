
let sqsum xs =
  let f a x = a * a in
  let base = match xs with | [] -> [] | x::xs' -> f x xs' in
  List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a * a in let base = f 2 xs in List.fold_left f base xs;;

*)

(* changed spans
(4,13)-(4,57)
EMPTY
EmptyG

(4,19)-(4,21)
EMPTY
EmptyG

(4,35)-(4,37)
EMPTY
EmptyG

(4,52)-(4,53)
EMPTY
EmptyG

(4,54)-(4,57)
2
LitG

(5,2)-(5,26)
xs
VarG

*)
