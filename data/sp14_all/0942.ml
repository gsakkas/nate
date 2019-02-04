
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  ((((clone 0 leng1) - leng2) @ l1), (((clone 0 leng2) - leng1) @ l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  (((clone 0 (leng1 - leng2)) @ l1), ((clone 0 (leng2 - leng1)) @ l2));;

*)

(* changed spans
(7,4)-(7,29)
EMPTY
EmptyG

(7,14)-(7,19)
leng1 - leng2
BopG VarG VarG

(7,38)-(7,63)
EMPTY
EmptyG

(7,48)-(7,53)
leng2 - leng1
BopG VarG VarG

*)
