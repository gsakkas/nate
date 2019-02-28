
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
    let f a x = (0, 0) in
    let base = (0, 0) in
    let args = (l1, l2) in let (_,res) = List.fold_left f base args in res in
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
    let f a x = ([0], [0]) in
    let base = ([0], [0]) in
    let args = l1 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,17)-(20,18)
[0]
ListG LitG

(20,20)-(20,21)
[0]
ListG LitG

(21,16)-(21,17)
[0]
ListG LitG

(21,19)-(21,20)
[0]
ListG LitG

(22,15)-(22,23)
l1
VarG

*)

(* changed exprs
List (Just (20,17)-(20,20)) [Lit (Just (20,18)-(20,19)) (LI 0)] Nothing
List (Just (20,22)-(20,25)) [Lit (Just (20,23)-(20,24)) (LI 0)] Nothing
List (Just (21,16)-(21,19)) [Lit (Just (21,17)-(21,18)) (LI 0)] Nothing
List (Just (21,21)-(21,24)) [Lit (Just (21,22)-(21,23)) (LI 0)] Nothing
Var (Just (22,15)-(22,17)) "l1"
*)

(* typed spans
(20,17)-(20,20)
(20,22)-(20,25)
(21,16)-(21,19)
(21,21)-(21,24)
(22,15)-(22,17)
*)

(* correct types
int list
int list
int list
int list
int list
*)

(* bad types
int
int
int
int
(int list * int list)
*)
