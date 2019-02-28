
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x = y
  then (l1, l2)
  else
    if x < y
    then (((clone 0 (y - x)) @ l1), l2)
    else (l1, ((clone 0 (x - y)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = ((x [0]) + (x [1])) :: a in
    let base = [] in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x = y
  then (l1, l2)
  else
    if x < y
    then (((clone 0 (y - x)) @ l1), l2)
    else (l1, ((clone 0 (x - y)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (l1x,l2x) = x in let (a1,a2) = a in (a1, ((l1x + l2x) :: a2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,16)-(19,40)
let (l1x , l2x) = x in
let (a1 , a2) = a in
(a1 , (l1x + l2x) :: a2)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(20,15)-(20,17)
([] , [])
TupleG (fromList [ListG EmptyG])

(21,4)-(22,51)
[]
ListG EmptyG

(21,15)-(21,33)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Let (Just (20,6)-(20,71)) NonRec [(TuplePat (Just (20,11)-(20,18)) [VarPat (Just (20,11)-(20,14)) "l1x",VarPat (Just (20,15)-(20,18)) "l2x"],Var (Just (20,22)-(20,23)) "x")] (Let (Just (20,27)-(20,71)) NonRec [(TuplePat (Just (20,32)-(20,37)) [VarPat (Just (20,32)-(20,34)) "a1",VarPat (Just (20,35)-(20,37)) "a2"],Var (Just (20,41)-(20,42)) "a")] (Tuple (Just (20,46)-(20,71)) [Var (Just (20,47)-(20,49)) "a1",ConApp (Just (20,51)-(20,70)) "::" (Just (Tuple (Just (20,52)-(20,69)) [Bop (Just (20,52)-(20,63)) Plus (Var (Just (20,53)-(20,56)) "l1x") (Var (Just (20,59)-(20,62)) "l2x"),Var (Just (20,67)-(20,69)) "a2"])) Nothing]))
Tuple (Just (21,15)-(21,23)) [List (Just (21,16)-(21,18)) [] Nothing,List (Just (21,20)-(21,22)) [] Nothing]
List (Just (21,20)-(21,22)) [] Nothing
App (Just (22,15)-(22,44)) (Var (Just (22,15)-(22,23)) "List.rev") [App (Just (22,24)-(22,44)) (Var (Just (22,25)-(22,37)) "List.combine") [Var (Just (22,38)-(22,40)) "l1",Var (Just (22,41)-(22,43)) "l2"]]
*)

(* typed spans
(20,6)-(20,71)
(21,15)-(21,23)
(21,20)-(21,22)
(22,15)-(22,44)
*)

(* correct types
('a list * int list)
('a list * int list)
int list
(int * int) list
*)

(* bad types
int list
int list
int list
(int * int) list
*)
