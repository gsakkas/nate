
let sqsum xs =
  let f a x a x = a + (x * x) in let base = "" in List.fold_left f base xs;;


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

(3,44)-(3,46)
0
LitG

(3,65)-(3,66)
EMPTY
EmptyG

(3,67)-(3,71)
fun a -> fun x -> a + (x * x)
LamG (LamG EmptyG)

(3,72)-(3,74)
fun x -> a + (x * x)
LamG (BopG EmptyG EmptyG)

*)
