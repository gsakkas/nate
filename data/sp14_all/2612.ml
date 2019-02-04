
let rec clone x n =
  let acc = [] in if n > 0 then clone (x :: x) (n - 1) else [];;


(* fix

let rec clone x n = let acc = [x] in if n > 0 then clone x (n - 1) else [];;

*)

(* changed spans
(3,12)-(3,14)
[x]
ListG VarG Nothing

(3,18)-(3,62)
x
VarG

(3,38)-(3,46)
EMPTY
EmptyG

(3,44)-(3,45)
EMPTY
EmptyG

*)
