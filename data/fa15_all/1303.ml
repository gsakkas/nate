
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference = (List.length l1) - (List.length l2) in
  if difference > 0 then (clone 0 difference) :: l1;;


(* fix

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  let retTuple = (l1, l2) in retTuple;;

*)

(* changed spans
(2,14)-(2,64)
EMPTY
EmptyG

(5,2)-(6,51)
let difference1 =
  List.length l1 - List.length l2 in
let difference2 =
  List.length l2 - List.length l1 in
let retTuple = (l1 , l2) in
retTuple
LetG NonRec (fromList [BopG EmptyG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(6,2)-(6,51)
let difference2 =
  List.length l2 - List.length l1 in
let retTuple = (l1 , l2) in
retTuple
LetG NonRec (fromList [BopG EmptyG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(6,49)-(6,51)
List.length l2 - List.length l1
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* typed spans
(3,2)-(5,37)
(4,2)-(5,37)
(4,20)-(4,55)
*)

(* typed spans
('a list * 'b list)
('a list * 'b list)
int
*)

(* typed spans
unit
unit
int list list
*)
