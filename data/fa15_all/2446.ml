
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
      let sum = (l1x + l2x) + a1 in
      (((sum / 10) :: a1), ((sum mod 10) :: a2)) in
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
      let test = match a1 with | [] -> 0 | h::t -> h in
      let sum = (l1x + l2x) + test in
      (((sum / 10) :: a1), ((sum mod 10) :: a2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(22,6)-(23,48)
let test =
  match a1 with
  | [] -> 0
  | h :: t -> h in
let sum =
  (l1x + l2x) + test in
((sum / 10) :: a1 , (sum mod 10) :: a2)
LetG NonRec (fromList [CaseG EmptyG (fromList [(Nothing,EmptyG)])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Let (Just (22,6)-(24,48)) NonRec [(VarPat (Just (22,10)-(22,14)) "test",Case (Just (22,17)-(22,52)) (Var (Just (22,23)-(22,25)) "a1") [(ConPat (Just (22,33)-(22,35)) "[]" Nothing,Nothing,Lit (Just (22,39)-(22,40)) (LI 0)),(ConsPat (Just (22,43)-(22,47)) (VarPat (Just (22,43)-(22,44)) "h") (VarPat (Just (22,46)-(22,47)) "t"),Nothing,Var (Just (22,51)-(22,52)) "h")])] (Let (Just (23,6)-(24,48)) NonRec [(VarPat (Just (23,10)-(23,13)) "sum",Bop (Just (23,16)-(23,34)) Plus (Bop (Just (23,16)-(23,27)) Plus (Var (Just (23,17)-(23,20)) "l1x") (Var (Just (23,23)-(23,26)) "l2x")) (Var (Just (23,30)-(23,34)) "test"))] (Tuple (Just (24,6)-(24,48)) [ConApp (Just (24,7)-(24,25)) "::" (Just (Tuple (Just (24,8)-(24,24)) [Bop (Just (24,8)-(24,18)) Div (Var (Just (24,9)-(24,12)) "sum") (Lit (Just (24,15)-(24,17)) (LI 10)),Var (Just (24,22)-(24,24)) "a1"])) Nothing,ConApp (Just (24,27)-(24,47)) "::" (Just (Tuple (Just (24,28)-(24,46)) [Bop (Just (24,28)-(24,40)) Mod (Var (Just (24,29)-(24,32)) "sum") (Lit (Just (24,37)-(24,39)) (LI 10)),Var (Just (24,44)-(24,46)) "a2"])) Nothing]))
*)

(* typed spans
(22,6)-(24,48)
*)

(* correct types
(int list * int list)
*)

(* bad types
(int list * int list)
*)
