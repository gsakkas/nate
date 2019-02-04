
let sqsum xs =
  let f a x a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x a x = a + x in
  let base = 0 in List.fold_left (fun a  -> fun x  -> a + (x * x)) 0 xs;;

*)

(* changed spans
(3,22)-(3,29)
EMPTY
EmptyG

(3,27)-(3,28)
EMPTY
EmptyG

(3,64)-(3,65)
EMPTY
EmptyG

(3,66)-(3,70)
fun a -> fun x -> a + (x * x)
LamG (LamG EmptyG)

(3,71)-(3,73)
fun x -> a + (x * x)
LamG (BopG EmptyG EmptyG)

*)
