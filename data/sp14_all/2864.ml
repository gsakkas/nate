
let rec clone x n =
  let helper = match n with | 0 -> [] | _ -> x :: ((clone x n) - 1) in
  helper n;;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,2)-(4,10)
EMPTY
EmptyG

(3,50)-(3,67)
EMPTY
EmptyG

(3,60)-(3,61)
n - 1
BopG VarG LitG

(4,2)-(4,8)
EMPTY
EmptyG

(4,2)-(4,10)
EMPTY
EmptyG

(4,9)-(4,10)
EMPTY
EmptyG

*)
