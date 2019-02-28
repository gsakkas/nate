
let rec clone x n =
  let rec cloneHelper x n acc =
    if n <= 0 then acc else cloneHelper x (n - 1) (x :: acc) in
  cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then ((List.append (clone 0 (abs diff)) l1), l2)
  else if diff > 0 then (l1, (List.append (clone 0 diff) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = (fst a) + ((fst x) + (snd x)) in
      ((sum / 10), ((sum mod 10) :: (snd a))) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in List.rev res in
  removeZero (add ((padZero 0) :: (l1 0) :: l2));;


(* fix

let rec clone x n =
  let rec cloneHelper x n acc =
    if n <= 0 then acc else cloneHelper x (n - 1) (x :: acc) in
  cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then ((List.append (clone 0 (abs diff)) l1), l2)
  else if diff > 0 then (l1, (List.append (clone 0 diff) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = (fst a) + ((fst x) + (snd x)) in
      ((sum / 10), ((sum mod 10) :: (snd a))) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in List.rev res in
  removeZero (add (padZero (0 :: l1) (0 :: l2)));;

*)

(* changed spans
(24,18)-(24,47)
padZero (0 :: l1) (0 :: l2)
AppG (fromList [ConAppG (Just (TupleG (fromList [VarG,LitG])))])

*)

(* changed exprs
App (Just (24,18)-(24,47)) (Var (Just (24,19)-(24,26)) "padZero") [ConApp (Just (24,27)-(24,36)) "::" (Just (Tuple (Just (24,28)-(24,35)) [Lit (Just (24,28)-(24,29)) (LI 0),Var (Just (24,33)-(24,35)) "l1"])) Nothing,ConApp (Just (24,37)-(24,46)) "::" (Just (Tuple (Just (24,38)-(24,45)) [Lit (Just (24,38)-(24,39)) (LI 0),Var (Just (24,43)-(24,45)) "l2"])) Nothing]
*)

(* typed spans
(24,18)-(24,47)
*)

(* correct types
(int list * int list)
*)

(* bad types
'a list
*)
