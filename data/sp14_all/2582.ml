
let rec clone x n =
  let rec helper a b acc = if b > 0 then helper a (b - 1) (a :: acc) else acc in
  helper x n [];;

let padZero l1 l2 =
  let l1_len = List.length l1 in
  let l2_len = List.length l2 in
  let l_diff = l1_len - l2_len in
  if l_diff < 0
  then (((clone 0 (l_diff * (-1))) @ l1), l2)
  else (l1, ((clone 0 l_diff) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = (x *. x) +. a in
    let base = [] in
    let args = l1 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec helper a b acc = if b > 0 then helper a (b - 1) (a :: acc) else acc in
  helper x n [];;

let padZero l1 l2 =
  let l1_len = List.length l1 in
  let l2_len = List.length l2 in
  let l_diff = l1_len - l2_len in
  if l_diff < 0
  then (((clone 0 (l_diff * (-1))) @ l1), l2)
  else (l1, ((clone 0 l_diff) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = ([x + 1], [x + 1]) in
    let base = ([], []) in
    let args = l1 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,16)-(19,29)
([x + 1] , [x + 1])
TupleG (fromList [ListG EmptyG])

(20,15)-(20,17)
([] , [])
TupleG (fromList [ListG EmptyG])

(21,4)-(21,68)
[]
ListG EmptyG

*)

(* changed exprs
Tuple (Just (19,16)-(19,34)) [List (Just (19,17)-(19,24)) [Bop (Just (19,18)-(19,23)) Plus (Var (Just (19,18)-(19,19)) "x") (Lit (Just (19,22)-(19,23)) (LI 1))] Nothing,List (Just (19,26)-(19,33)) [Bop (Just (19,27)-(19,32)) Plus (Var (Just (19,27)-(19,28)) "x") (Lit (Just (19,31)-(19,32)) (LI 1))] Nothing]
Tuple (Just (20,15)-(20,23)) [List (Just (20,16)-(20,18)) [] Nothing,List (Just (20,20)-(20,22)) [] Nothing]
List (Just (20,20)-(20,22)) [] Nothing
*)

(* typed spans
(19,16)-(19,34)
(20,15)-(20,23)
(20,20)-(20,22)
*)

(* correct types
(int list * int list)
(int list * int list)
int list
*)

(* bad types
float
'a list
int list
*)
