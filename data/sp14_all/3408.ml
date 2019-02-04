
let rec clone x n =
  if n < 1
  then []
  else
    (let rec helper acc f x =
       match x with | 0 -> acc | _ -> (helper (f :: acc) f x) - 1 in
     helper [] x n);;


(* fix

let rec clone x n =
  if n < 1
  then []
  else
    (let rec helper acc f x =
       match x with | 0 -> acc | _ -> helper (f :: acc) f (x - 1) in
     helper [] x n);;

*)

(* changed spans
(7,38)-(7,65)
EMPTY
EmptyG

(7,59)-(7,60)
x - 1
BopG VarG LitG

*)
