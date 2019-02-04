
let rec clone x n = if n > 0 then List.append [x] (clone x (n - 1)) else [];;

let padZero l1 l2 =
  ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1),
    (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | _ -> let h::t = l in (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (a1,a2) = a in
      let (x1,x2) = x in
      let val1 = (a1 + x1) + x2 in
      if val1 > 9 then (1, ((val1 - 10) :: a2)) else (0, (val1 :: a2)) in
    let base = (0, []) in
    let args = List.rev ((List.combine [0]) @ ((l1 [0]) @ l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then List.append [x] (clone x (n - 1)) else [];;

let padZero l1 l2 =
  ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1),
    (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | _ -> let h::t = l in (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (a1,a2) = a in
      let (x1,x2) = x in
      let val1 = (a1 + x1) + x2 in
      if val1 > 9 then (1, ((val1 - 10) :: a2)) else (0, (val1 :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(21,25)-(21,43)
EMPTY
EmptyG

(21,39)-(21,42)
0 :: l1
ConAppG (Just (TupleG (fromList [VarG,LitG]))) Nothing

(21,44)-(21,45)
EMPTY
EmptyG

(21,46)-(21,61)
EMPTY
EmptyG

(21,47)-(21,55)
EMPTY
EmptyG

(21,51)-(21,54)
0 :: l2
ConAppG (Just (TupleG (fromList [VarG,LitG]))) Nothing

(21,56)-(21,57)
EMPTY
EmptyG

*)
