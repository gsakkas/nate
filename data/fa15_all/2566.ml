
let sqsum xs =
  let f a x a x = a + x in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x a x = a + x in
  let base = 0 in List.fold_left (fun a  -> fun x  -> a + (x * x)) 0 xs;;

*)

(* changed spans
(3,58)-(3,59)
EMPTY
EmptyG

(3,60)-(3,64)
fun a -> fun x -> a + (x * x)
LamG (LamG EmptyG)

(3,65)-(3,67)
fun x -> a + (x * x)
LamG (BopG EmptyG EmptyG)

*)
