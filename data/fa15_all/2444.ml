
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
      let (l1x,l2x) = x in
      let (a1,a2) = a in
      let sum = l1x + l2x in
      let a1 (0::[]) = (a1 [0]) + (sum / 10) in
      ((0 :: a2), ((sum mod 10) :: a2)) in
    let base = ([], []) in
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
      let (l1x,l2x) = x in
      let (a1,a2) = a in
      let sum = l1x + l2x in (((sum mod 10) :: a2), ((sum / 10) :: a1)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,6)-(24,39)
((sum mod 10) :: a2 , (sum / 10) :: a1)
TupleG (fromList [ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG])))])

*)

(* changed exprs
Tuple (Just (22,29)-(22,71)) [ConApp (Just (22,30)-(22,50)) "::" (Just (Tuple (Just (22,31)-(22,49)) [Bop (Just (22,31)-(22,43)) Mod (Var (Just (22,32)-(22,35)) "sum") (Lit (Just (22,40)-(22,42)) (LI 10)),Var (Just (22,47)-(22,49)) "a2"])) Nothing,ConApp (Just (22,52)-(22,70)) "::" (Just (Tuple (Just (22,53)-(22,69)) [Bop (Just (22,53)-(22,63)) Div (Var (Just (22,54)-(22,57)) "sum") (Lit (Just (22,60)-(22,62)) (LI 10)),Var (Just (22,67)-(22,69)) "a1"])) Nothing]
*)

(* typed spans
(22,29)-(22,71)
*)

(* correct types
(int list * int list)
*)

(* bad types
(int list * int list)
*)
