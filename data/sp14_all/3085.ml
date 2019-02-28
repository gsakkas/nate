
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
[0 ; 0 ; 9 ; 9]
ListG LitG

(4,10)-(7,15)
[1 ; 0 ; 0 ; 2]
ListG LitG

(4,10)-(7,15)
(3 , 3) :: (List.rev (List.combine l1
                                   l2))
ConAppG (Just (TupleG (fromList [AppG (fromList [AppG (fromList [VarG])]),TupleG (fromList [LitG])])))

(19,16)-(19,21)
x
VarG

(20,4)-(21,70)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG])

(20,15)-(20,16)
[]
ListG EmptyG

(21,16)-(21,18)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG])

*)

(* changed exprs
List (Just (2,9)-(2,21)) [Lit (Just (2,10)-(2,11)) (LI 0),Lit (Just (2,13)-(2,14)) (LI 0),Lit (Just (2,16)-(2,17)) (LI 9),Lit (Just (2,19)-(2,20)) (LI 9)] Nothing
List (Just (4,9)-(4,21)) [Lit (Just (4,10)-(4,11)) (LI 1),Lit (Just (4,13)-(4,14)) (LI 0),Lit (Just (4,16)-(4,17)) (LI 0),Lit (Just (4,19)-(4,20)) (LI 2)] Nothing
ConApp (Just (6,8)-(6,49)) "::" (Just (Tuple (Just (6,8)-(6,49)) [Tuple (Just (6,8)-(6,14)) [Lit (Just (6,9)-(6,10)) (LI 3),Lit (Just (6,12)-(6,13)) (LI 3)],App (Just (6,18)-(6,49)) (Var (Just (6,19)-(6,27)) "List.rev") [App (Just (6,28)-(6,48)) (Var (Just (6,29)-(6,41)) "List.combine") [Var (Just (6,42)-(6,44)) "l1",Var (Just (6,45)-(6,47)) "l2"]]])) Nothing
Var (Just (23,16)-(23,17)) "x"
Tuple (Just (24,15)-(24,22)) [Lit (Just (24,16)-(24,17)) (LI 0),List (Just (24,19)-(24,21)) [] Nothing]
List (Just (24,19)-(24,21)) [] Nothing
Tuple (Just (25,16)-(25,23)) [Lit (Just (25,17)-(25,18)) (LI 0),List (Just (25,20)-(25,22)) [] Nothing]
*)

(* typed spans
(2,9)-(2,21)
(4,9)-(4,21)
(6,8)-(6,49)
(23,16)-(23,17)
(24,15)-(24,22)
(24,19)-(24,21)
(25,16)-(25,23)
*)

(* correct types
int list
int list
(int * int) list
(int * int list)
(int * int list)
int list
(int * int list)
*)

(* bad types
'a -> 'a
int -> int -> int list
int -> int -> int list
int
'a
int
int
*)
