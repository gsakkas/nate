
let sqsum xs =
  let f a x = match x with | [] -> 0 | _ -> a * a in
  let base = List.hd xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a * a in let base = List.hd xs in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,49)
EMPTY
EmptyG

(3,20)-(3,21)
EMPTY
EmptyG

(3,35)-(3,36)
EMPTY
EmptyG

*)
