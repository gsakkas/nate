
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
    let f a x = let (l1x,l2x) = x in (0, (l1x + l2x)) :: a in
    let base = (0, 0) in
    let args = List.rev (List.combine l1 l2) in
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
(19,37)-(19,58)
let (a1 , a2) = a in
(a1 , (l1x + l2x) :: a2)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(20,19)-(20,20)
[]
ListG EmptyG

(21,4)-(22,51)
[]
ListG EmptyG

*)

(* changed exprs
Let (Just (20,27)-(20,71)) NonRec [(TuplePat (Just (20,32)-(20,37)) [VarPat (Just (20,32)-(20,34)) "a1",VarPat (Just (20,35)-(20,37)) "a2"],Var (Just (20,41)-(20,42)) "a")] (Tuple (Just (20,46)-(20,71)) [Var (Just (20,47)-(20,49)) "a1",ConApp (Just (20,51)-(20,70)) "::" (Just (Tuple (Just (20,52)-(20,69)) [Bop (Just (20,52)-(20,63)) Plus (Var (Just (20,53)-(20,56)) "l1x") (Var (Just (20,59)-(20,62)) "l2x"),Var (Just (20,67)-(20,69)) "a2"])) Nothing])
List (Just (21,16)-(21,18)) [] Nothing
List (Just (21,20)-(21,22)) [] Nothing
*)

(* typed spans
(20,27)-(20,71)
(21,16)-(21,18)
(21,20)-(21,22)
*)

(* correct types
('a list * int list)
'a list
int list
*)

(* bad types
(int * int) list
int
int list
*)
