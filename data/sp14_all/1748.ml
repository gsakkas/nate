
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
    let f a x = a + x in
    let base = (0, 0) in
    let args =
      let combo = List.combine (List.rev l1) (List.rev l2) in
      match combo with
      | (i,j) -> if (i + j) > 9 then (1, ((i + j) - 10)) else (0, (i + j))
      | [] -> (0, 0) in
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
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,16)-(19,21)
let (i , j) = x in
let (s , t) = a in
(((i + j) + s) / 10 , (((i + j) + s) mod 10) :: t)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(20,19)-(20,20)
[]
ListG EmptyG

(22,6)-(25,20)
List.combine (List.rev l1)
             (List.rev l2)
AppG (fromList [AppG (fromList [EmptyG])])

(22,6)-(25,20)
List.combine
VarG

(22,6)-(25,20)
List.rev l1
AppG (fromList [VarG])

(22,6)-(25,20)
List.rev
VarG

(22,6)-(25,20)
l1
VarG

(22,6)-(25,20)
List.rev l2
AppG (fromList [VarG])

(22,6)-(25,20)
List.rev
VarG

(22,6)-(25,20)
l2
VarG

*)

(* changed exprs
Let (Just (20,6)-(21,76)) NonRec [(TuplePat (Just (20,11)-(20,14)) [VarPat (Just (20,11)-(20,12)) "i",VarPat (Just (20,13)-(20,14)) "j"],Var (Just (20,18)-(20,19)) "x")] (Let (Just (21,6)-(21,76)) NonRec [(TuplePat (Just (21,11)-(21,14)) [VarPat (Just (21,11)-(21,12)) "s",VarPat (Just (21,13)-(21,14)) "t"],Var (Just (21,18)-(21,19)) "a")] (Tuple (Just (21,23)-(21,76)) [Bop (Just (21,24)-(21,44)) Div (Bop (Just (21,25)-(21,38)) Plus (Bop (Just (21,26)-(21,33)) Plus (Var (Just (21,27)-(21,28)) "i") (Var (Just (21,31)-(21,32)) "j")) (Var (Just (21,36)-(21,37)) "s")) (Lit (Just (21,41)-(21,43)) (LI 10)),ConApp (Just (21,46)-(21,75)) "::" (Just (Tuple (Just (21,47)-(21,74)) [Bop (Just (21,47)-(21,69)) Mod (Bop (Just (21,48)-(21,61)) Plus (Bop (Just (21,49)-(21,56)) Plus (Var (Just (21,50)-(21,51)) "i") (Var (Just (21,54)-(21,55)) "j")) (Var (Just (21,59)-(21,60)) "s")) (Lit (Just (21,66)-(21,68)) (LI 10)),Var (Just (21,73)-(21,74)) "t"])) Nothing]))
List (Just (22,19)-(22,21)) [] Nothing
App (Just (23,15)-(23,55)) (Var (Just (23,15)-(23,27)) "List.combine") [App (Just (23,28)-(23,41)) (Var (Just (23,29)-(23,37)) "List.rev") [Var (Just (23,38)-(23,40)) "l1"],App (Just (23,42)-(23,55)) (Var (Just (23,43)-(23,51)) "List.rev") [Var (Just (23,52)-(23,54)) "l2"]]
Var (Just (23,15)-(23,27)) "List.combine"
App (Just (23,28)-(23,41)) (Var (Just (23,29)-(23,37)) "List.rev") [Var (Just (23,38)-(23,40)) "l1"]
Var (Just (23,29)-(23,37)) "List.rev"
Var (Just (23,38)-(23,40)) "l1"
App (Just (23,42)-(23,55)) (Var (Just (23,43)-(23,51)) "List.rev") [Var (Just (23,52)-(23,54)) "l2"]
Var (Just (23,43)-(23,51)) "List.rev"
Var (Just (23,52)-(23,54)) "l2"
*)

(* typed spans
(20,6)-(21,76)
(22,19)-(22,21)
(23,15)-(23,55)
(23,15)-(23,27)
(23,28)-(23,41)
(23,29)-(23,37)
(23,38)-(23,40)
(23,42)-(23,55)
(23,43)-(23,51)
(23,52)-(23,54)
*)

(* correct types
(int * int list)
int list
(int * int) list
int list -> int list -> (int * int) list
int list
int list -> int list
int list
int list
int list -> int list
int list
*)

(* bad types
int
int
(int * int)
(int * int)
(int * int)
(int * int)
(int * int)
(int * int)
(int * int)
(int * int)
*)
