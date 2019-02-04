
let rec clone x n =
  if n <= 0
  then []
  else (match x with | [] -> x | h::t -> (clone h) :: (x (n - 1)));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(5,7)-(5,66)
EMPTY
EmptyG

(5,14)-(5,15)
EMPTY
EmptyG

(5,29)-(5,30)
EMPTY
EmptyG

(5,41)-(5,50)
x
VarG

(5,42)-(5,47)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

(5,48)-(5,49)
EMPTY
EmptyG

(5,54)-(5,65)
EMPTY
EmptyG

*)
