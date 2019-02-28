
let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (h::t,b) = a in a = (t, b) in
    let base = ((List.rev l1), []) in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (h::t,_) = a in ([], []) in
    let base = ((List.rev l1), []) in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,16)-(19,46)
let (h :: t , _) = a in
([] , [])
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (19,16)-(19,44)) NonRec [(TuplePat (Just (19,21)-(19,27)) [ConsPat (Just (19,21)-(19,25)) (VarPat (Just (19,21)-(19,22)) "h") (VarPat (Just (19,24)-(19,25)) "t"),WildPat (Just (19,26)-(19,27))],Var (Just (19,31)-(19,32)) "a")] (Tuple (Just (19,36)-(19,44)) [List (Just (19,37)-(19,39)) [] Nothing,List (Just (19,41)-(19,43)) [] Nothing])
*)

(* typed spans
(19,16)-(19,44)
*)

(* correct types
(int list * int list)
*)

(* bad types
bool
*)
