
let rec clone x n =
  let rec clone_RT acc n =
    if n <= 0 then acc else clone_RT (x :: acc) (n - 1) in
  clone_RT [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let diff = len1 - len2 in
  if diff < 0
  then ((List.append (clone 0 (- diff)) l1), l2)
  else (l1, (List.append (clone 0 diff) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = ([0], [0]) in
    let base = (0, 0) in
    let args = (0, (clone 0 List.length l1)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec clone_RT acc n =
    if n <= 0 then acc else clone_RT (x :: acc) (n - 1) in
  clone_RT [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let diff = len1 - len2 in
  if diff < 0
  then ((List.append (clone 0 (- diff)) l1), l2)
  else (l1, (List.append (clone 0 diff) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = (0, []) in
    let base = (0, []) in
    let args = clone 0 (List.length l1) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,17)-(20,20)
0
LitG

(20,22)-(20,25)
[]
ListG EmptyG

(21,19)-(21,20)
[]
ListG EmptyG

(22,15)-(22,44)
clone 0 (List.length l1)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
Lit (Just (20,17)-(20,18)) (LI 0)
List (Just (20,20)-(20,22)) [] Nothing
List (Just (21,19)-(21,21)) [] Nothing
App (Just (22,15)-(22,39)) (Var (Just (22,15)-(22,20)) "clone") [Lit (Just (22,21)-(22,22)) (LI 0),App (Just (22,23)-(22,39)) (Var (Just (22,24)-(22,35)) "List.length") [Var (Just (22,36)-(22,38)) "l1"]]
*)

(* typed spans
(20,17)-(20,18)
(20,20)-(20,22)
(21,19)-(21,21)
(22,15)-(22,39)
*)

(* correct types
int
int list
int list
int list
*)

(* bad types
int list
int list
int
(int * 'a)
*)
