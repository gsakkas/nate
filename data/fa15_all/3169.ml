
let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (x1,x2) = x in (x1, x2) in
    let base = [] in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (x1,x2) = x in ([x1 + x2], [x2]) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(22,36)-(22,38)
[x1 + x2]
ListG (BopG EmptyG EmptyG)

(23,4)-(25,51)
[x2]
ListG VarG

(23,15)-(23,17)
([] , [])
TupleG (fromList [ListG EmptyG])

(24,4)-(25,51)
[]
ListG EmptyG

*)

(* changed exprs
List (Just (22,36)-(22,45)) [Bop (Just (22,37)-(22,44)) Plus (Var (Just (22,37)-(22,39)) "x1") (Var (Just (22,42)-(22,44)) "x2")] Nothing
List (Just (22,47)-(22,51)) [Var (Just (22,48)-(22,50)) "x2"] Nothing
Tuple (Just (23,15)-(23,23)) [List (Just (23,16)-(23,18)) [] Nothing,List (Just (23,20)-(23,22)) [] Nothing]
List (Just (23,20)-(23,22)) [] Nothing
*)

(* typed spans
(22,36)-(22,45)
(22,47)-(22,51)
(23,15)-(23,23)
(23,20)-(23,22)
*)

(* correct types
int list
int list
(int list * int list)
int list
*)

(* bad types
'a
int list
'a list
int list
*)
