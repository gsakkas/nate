
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
    let base = 0 in
    let args = [l1] in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


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

(20,15)-(20,16)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(21,4)-(21,70)
[]
ListG EmptyG Nothing

(21,16)-(21,18)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(21,23)-(21,70)
[]
ListG EmptyG Nothing

*)
