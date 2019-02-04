
let x x = x;;

let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else x :: xs;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a + x in
    let base = [1] in
    let args = [(l1, l2)] in let (_,res) = List.fold_left f base args in res in
  (removeZero (add (padZero l1 l2)) 0 0 9 9) + (1 0 0 2);;


(* fix

let l1 = [0; 0; 9; 9];;

let l2 = [1; 0; 0; 2];;

let x = (3, 3) :: (List.rev (List.combine l1 l2));;

let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else x :: xs;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = x in
    let base = (0, []) in
    let args = [(0, [])] in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(2,6)-(2,11)
EMPTY
EmptyG

(2,10)-(2,11)
[0 ; 0 ; 9 ; 9]
ListG LitG Nothing

(4,10)-(7,15)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(19,16)-(19,17)
EMPTY
EmptyG

(19,16)-(19,21)
EMPTY
EmptyG

(20,15)-(20,18)
EMPTY
EmptyG

(20,16)-(20,17)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(21,4)-(21,76)
[]
ListG EmptyG Nothing

(21,17)-(21,19)
EMPTY
EmptyG

(21,21)-(21,23)
0
LitG

(21,29)-(21,76)
[]
ListG EmptyG Nothing

(22,2)-(22,44)
removeZero (add (padZero l1
                         l2))
AppG (fromList [AppG (fromList [EmptyG])])

(22,2)-(22,56)
EMPTY
EmptyG

(22,36)-(22,37)
EMPTY
EmptyG

(22,38)-(22,39)
EMPTY
EmptyG

(22,40)-(22,41)
EMPTY
EmptyG

(22,42)-(22,43)
EMPTY
EmptyG

(22,47)-(22,56)
EMPTY
EmptyG

(22,48)-(22,49)
EMPTY
EmptyG

(22,50)-(22,51)
EMPTY
EmptyG

(22,52)-(22,53)
EMPTY
EmptyG

(22,54)-(22,55)
EMPTY
EmptyG

*)
