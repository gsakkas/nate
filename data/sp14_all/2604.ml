
let rec clone x n =
  let rec helper a b acc = if b > 0 then helper a (b - 1) (a :: acc) else acc in
  helper x n [];;

let padZero l1 l2 =
  let l1_len = List.length l1 in
  let l2_len = List.length l2 in
  let l_diff = l1_len - l2_len in
  if l_diff < 0
  then (((clone 0 (l_diff * (-1))) @ l1), l2)
  else (l1, ((clone 0 l_diff) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | (a,b) -> (a + b) mod 10 in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (bar,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec helper a b acc = if b > 0 then helper a (b - 1) (a :: acc) else acc in
  helper x n [];;

let padZero l1 l2 =
  let l1_len = List.length l1 in
  let l2_len = List.length l2 in
  let l_diff = l1_len - l2_len in
  if l_diff < 0
  then (((clone 0 (l_diff * (-1))) @ l1), l2)
  else (l1, ((clone 0 l_diff) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (b1,b2) = a in
      match x with
      | (fir,sec) ->
          if (fir + sec) < 10
          then ([], ((fir + sec) :: b2))
          else ([], ((fir + sec) :: b2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (bar,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,16)-(19,54)
let (b1 , b2) = a in
match x with
| (fir , sec) -> if (fir + sec) < 10
                 then ([] , (fir + sec) :: b2)
                 else ([] , (fir + sec) :: b2)
LetG NonRec (fromList [VarG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

*)

(* changed exprs
Let (Just (20,6)-(25,40)) NonRec [(TuplePat (Just (20,11)-(20,16)) [VarPat (Just (20,11)-(20,13)) "b1",VarPat (Just (20,14)-(20,16)) "b2"],Var (Just (20,20)-(20,21)) "a")] (Case (Just (21,6)-(25,40)) (Var (Just (21,12)-(21,13)) "x") [(TuplePat (Just (22,9)-(22,16)) [VarPat (Just (22,9)-(22,12)) "fir",VarPat (Just (22,13)-(22,16)) "sec"],Nothing,Ite (Just (23,10)-(25,40)) (Bop (Just (23,13)-(23,29)) Lt (Bop (Just (23,13)-(23,24)) Plus (Var (Just (23,14)-(23,17)) "fir") (Var (Just (23,20)-(23,23)) "sec")) (Lit (Just (23,27)-(23,29)) (LI 10))) (Tuple (Just (24,15)-(24,40)) [List (Just (24,16)-(24,18)) [] Nothing,ConApp (Just (24,20)-(24,39)) "::" (Just (Tuple (Just (24,21)-(24,38)) [Bop (Just (24,21)-(24,32)) Plus (Var (Just (24,22)-(24,25)) "fir") (Var (Just (24,28)-(24,31)) "sec"),Var (Just (24,36)-(24,38)) "b2"])) Nothing]) (Tuple (Just (25,15)-(25,40)) [List (Just (25,16)-(25,18)) [] Nothing,ConApp (Just (25,20)-(25,39)) "::" (Just (Tuple (Just (25,21)-(25,38)) [Bop (Just (25,21)-(25,32)) Plus (Var (Just (25,22)-(25,25)) "fir") (Var (Just (25,28)-(25,31)) "sec"),Var (Just (25,36)-(25,38)) "b2"])) Nothing]))])
*)

(* typed spans
(20,6)-(25,40)
*)

(* correct types
('a list * int list)
*)

(* bad types
int
*)
