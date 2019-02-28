
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
      let (s,t) = a in (s, t) ::
        (((((i + j) + s) + t) / 10), ((((i + j) + s) + t) mod 10)) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
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
(21,23)-(22,66)
(((i + j) + s) / 10 , (((i + j) + s) mod 10) :: t)
TupleG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG)])

*)

(* changed exprs
Tuple (Just (21,23)-(21,76)) [Bop (Just (21,24)-(21,44)) Div (Bop (Just (21,25)-(21,38)) Plus (Bop (Just (21,26)-(21,33)) Plus (Var (Just (21,27)-(21,28)) "i") (Var (Just (21,31)-(21,32)) "j")) (Var (Just (21,36)-(21,37)) "s")) (Lit (Just (21,41)-(21,43)) (LI 10)),ConApp (Just (21,46)-(21,75)) "::" (Just (Tuple (Just (21,47)-(21,74)) [Bop (Just (21,47)-(21,69)) Mod (Bop (Just (21,48)-(21,61)) Plus (Bop (Just (21,49)-(21,56)) Plus (Var (Just (21,50)-(21,51)) "i") (Var (Just (21,54)-(21,55)) "j")) (Var (Just (21,59)-(21,60)) "s")) (Lit (Just (21,66)-(21,68)) (LI 10)),Var (Just (21,73)-(21,74)) "t"])) Nothing]
*)

(* typed spans
(21,23)-(21,76)
*)

(* correct types
(int * int list)
*)

(* bad types
(int * int) list
*)
