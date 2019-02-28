
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
    let f a x = match x with | (a,b) -> a @ b in
    let base = [] in
    let args = (l1, l2) in let (_,res) = List.fold_left f base args in res in
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
(23,16)-(23,45)
x
VarG

(24,4)-(25,74)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG])

(25,4)-(25,74)
[(0 , [])]
ListG (TupleG (fromList [EmptyG]))

(25,20)-(25,22)
0
LitG

(25,20)-(25,22)
[]
ListG EmptyG

*)

(* changed exprs
Var (Just (23,16)-(23,17)) "x"
Tuple (Just (24,15)-(24,22)) [Lit (Just (24,16)-(24,17)) (LI 0),List (Just (24,19)-(24,21)) [] Nothing]
List (Just (25,15)-(25,24)) [Tuple (Just (25,16)-(25,23)) [Lit (Just (25,17)-(25,18)) (LI 0),List (Just (25,20)-(25,22)) [] Nothing]] Nothing
Lit (Just (25,17)-(25,18)) (LI 0)
List (Just (25,20)-(25,22)) [] Nothing
*)

(* typed spans
(23,16)-(23,17)
(24,15)-(24,22)
(25,15)-(25,24)
(25,17)-(25,18)
(25,20)-(25,22)
*)

(* correct types
(int * int list)
(int * int list)
(int * int list) list
int
int list
*)

(* bad types
'a list
int list
int list
int list
int list
*)
