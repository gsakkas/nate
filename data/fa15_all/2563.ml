
let sqsum xs =
  let f a x a x = a + (x * x) in
  let base base = base in List.fold_left f base xs;;


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

(4,11)-(4,22)
EMPTY
EmptyG

(4,18)-(4,22)
0
LitG

(4,41)-(4,42)
EMPTY
EmptyG

(4,43)-(4,47)
fun a -> fun x -> a + (x * x)
LamG (LamG EmptyG)

(4,48)-(4,50)
fun x -> a + (x * x)
LamG (BopG EmptyG EmptyG)

*)
