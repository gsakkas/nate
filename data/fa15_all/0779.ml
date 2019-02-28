
let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n < 0 then ((((clone 0) - n) :: l1), l2) else (l1, ((clone 0 n) :: l2));;


(* fix

let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n < 0 then (((clone 0 (- n)) @ l1), l2) else (l1, ((clone 0 n) @ l2));;

*)

(* changed spans
(7,17)-(7,40)
clone 0 (- n) @ l1
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(7,20)-(7,25)
clone 0 (- n)
AppG (fromList [UopG EmptyG,LitG])

(7,31)-(7,32)
(- n)
UopG VarG

(7,56)-(7,75)
EMPTY
EmptyG

(7,58)-(7,63)
clone 0 n
AppG (fromList [VarG,LitG])

*)

(* typed spans
(7,17)-(7,39)
(7,18)-(7,33)
(7,27)-(7,32)
(7,56)-(7,67)
*)

(* typed spans
int list
int list
int
int list
*)

(* typed spans
int list
int -> int -> int list
int
int -> int -> int list
*)
