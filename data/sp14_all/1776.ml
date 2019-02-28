
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let first = List.length l1 in
  let sec = List.length l2 in
  if first < sec
  then ((List.append (clone 0 (sec - first)) l1), l2)
  else
    if first > sec
    then (l1, (List.append (clone 0 (first - sec)) l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (i,j) = x in
      let (s,t) = a in ((((i + j) + s) / 10), ((((i + j) + s) mod 10) :: t)) in
    let base = (0, []) in
    let args = List.combine ((List.rev l1) :: 0) ((List.rev 0) :: l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let first = List.length l1 in
  let sec = List.length l2 in
  if first < sec
  then ((List.append (clone 0 (sec - first)) l1), l2)
  else
    if first > sec
    then (l1, (List.append (clone 0 (first - sec)) l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (i,j) = x in
      let (s,t) = a in ((((i + j) + s) / 10), ((((i + j) + s) mod 10) :: t)) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,28)-(23,48)
List.rev (0 :: l1)
AppG (fromList [ConAppG (Just (TupleG (fromList [VarG,LitG])))])

(23,51)-(23,59)
0 :: l2
ConAppG (Just (TupleG (fromList [VarG,LitG])))

*)

(* changed exprs
App (Just (23,28)-(23,48)) (Var (Just (23,29)-(23,37)) "List.rev") [ConApp (Just (23,38)-(23,47)) "::" (Just (Tuple (Just (23,39)-(23,46)) [Lit (Just (23,39)-(23,40)) (LI 0),Var (Just (23,44)-(23,46)) "l1"])) Nothing]
ConApp (Just (23,59)-(23,68)) "::" (Just (Tuple (Just (23,60)-(23,67)) [Lit (Just (23,60)-(23,61)) (LI 0),Var (Just (23,65)-(23,67)) "l2"])) Nothing
*)

(* typed spans
(23,28)-(23,48)
(23,59)-(23,68)
*)

(* correct types
int list
int list
*)

(* bad types
int list list
'a list -> 'a list
*)
