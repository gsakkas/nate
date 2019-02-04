
let rec sumList xs = if (List.length xs) > 0 then (List.hd xs) + (sumList xs);;


(* fix

let rec sumList xs = if xs = [] then 0 else (List.hd xs) + (sumList xs);;

*)

(* changed spans
(2,21)-(2,77)
EMPTY
EmptyG

(2,24)-(2,40)
EMPTY
EmptyG

(2,24)-(2,44)
EMPTY
EmptyG

(2,25)-(2,36)
xs = []
BopG VarG (ListG EmptyG Nothing)

(2,43)-(2,44)
[]
ListG EmptyG Nothing

*)
