
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
      let terms =
        match a2 with | [] -> (sum / 10) :: (sum mod 10) | h::t -> sum mod 10 in
      (((sum / 10) :: a1), (terms :: a2)) in
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
      match a2 with
      | [] -> ((0 :: a1), ((sum / 10) :: (sum mod 10) :: a2))
      | h::t -> (((sum / 10) :: a1), ((sum mod 10) :: a2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(24,6)-(26,41)
match a2 with
| [] -> (0 :: a1 , (sum / 10) :: ((sum mod 10) :: a2))
| h :: t -> ((sum / 10) :: a1 , (sum mod 10) :: a2)
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

*)

(* changed exprs
Case (Just (24,6)-(26,58)) (Var (Just (24,12)-(24,14)) "a2") [(ConPat (Just (25,8)-(25,10)) "[]" Nothing,Nothing,Tuple (Just (25,14)-(25,61)) [ConApp (Just (25,15)-(25,24)) "::" (Just (Tuple (Just (25,16)-(25,23)) [Lit (Just (25,16)-(25,17)) (LI 0),Var (Just (25,21)-(25,23)) "a1"])) Nothing,ConApp (Just (25,26)-(25,60)) "::" (Just (Tuple (Just (25,27)-(25,59)) [Bop (Just (25,27)-(25,37)) Div (Var (Just (25,28)-(25,31)) "sum") (Lit (Just (25,34)-(25,36)) (LI 10)),ConApp (Just (25,41)-(25,59)) "::" (Just (Tuple (Just (25,41)-(25,59)) [Bop (Just (25,41)-(25,53)) Mod (Var (Just (25,42)-(25,45)) "sum") (Lit (Just (25,50)-(25,52)) (LI 10)),Var (Just (25,57)-(25,59)) "a2"])) Nothing])) Nothing]),(ConsPat (Just (26,8)-(26,12)) (VarPat (Just (26,8)-(26,9)) "h") (VarPat (Just (26,11)-(26,12)) "t"),Nothing,Tuple (Just (26,16)-(26,58)) [ConApp (Just (26,17)-(26,35)) "::" (Just (Tuple (Just (26,18)-(26,34)) [Bop (Just (26,18)-(26,28)) Div (Var (Just (26,19)-(26,22)) "sum") (Lit (Just (26,25)-(26,27)) (LI 10)),Var (Just (26,32)-(26,34)) "a1"])) Nothing,ConApp (Just (26,37)-(26,57)) "::" (Just (Tuple (Just (26,38)-(26,56)) [Bop (Just (26,38)-(26,50)) Mod (Var (Just (26,39)-(26,42)) "sum") (Lit (Just (26,47)-(26,49)) (LI 10)),Var (Just (26,54)-(26,56)) "a2"])) Nothing])]
*)

(* typed spans
(24,6)-(26,58)
*)

(* correct types
(int list * int list)
*)

(* bad types
(int list * int list list)
*)
