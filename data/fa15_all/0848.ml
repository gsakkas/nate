
let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n ->
      if n < 0
      then (((clone 0 (n * (-1))) @ l1), l2)
      else (((clone 0 n) @ l2), l1);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match (x, a) with
      | ((fst,sec),_) ->
          if (fst + sec) > 9
          then (((fst + sec) - 10), 1)
          else ((fst + sec), 0)
      | ((fst,sec),(carry,digits)) ->
          if sec = 1
          then (1, (digits @ (fst, sec)))
          else (0, (digits @ (fst, sec))) in
    let base = (0, []) in
    let args = [(0, 0)] @ (List.rev (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n ->
      if n < 0
      then (((clone 0 (n * (-1))) @ l1), l2)
      else (((clone 0 n) @ l2), l1);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (fst,sec) = x in
      let (fst',sec') =
        if (fst + sec) > 9 then (((fst + sec) - 10), 1) else ((fst + sec), 0) in
      let (carry,digits) = a in
      let (carry',digits') =
        if sec' = 1 then (1, (digits @ [fst'])) else (0, (digits @ [fst'])) in
      (carry', digits') in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,6)-(27,41)
let (fst , sec) = x in
let (fst' , sec') =
  if (fst + sec) > 9
  then ((fst + sec) - 10 , 1)
  else (fst + sec , 0) in
let (carry , digits) = a in
let (carry' , digits') =
  if sec' = 1
  then (1 , digits @ [fst'])
  else (0 , digits @ [fst']) in
(carry' , digits')
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(29,53)-(29,55)
[(0 , 0)]
ListG (TupleG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (19,6)-(25,23)) NonRec [(TuplePat (Just (19,11)-(19,18)) [VarPat (Just (19,11)-(19,14)) "fst",VarPat (Just (19,15)-(19,18)) "sec"],Var (Just (19,22)-(19,23)) "x")] (Let (Just (20,6)-(25,23)) NonRec [(TuplePat (Just (20,11)-(20,20)) [VarPat (Just (20,11)-(20,15)) "fst'",VarPat (Just (20,16)-(20,20)) "sec'"],Ite (Just (21,8)-(21,77)) (Bop (Just (21,11)-(21,26)) Gt (Bop (Just (21,11)-(21,22)) Plus (Var (Just (21,12)-(21,15)) "fst") (Var (Just (21,18)-(21,21)) "sec")) (Lit (Just (21,25)-(21,26)) (LI 9))) (Tuple (Just (21,32)-(21,55)) [Bop (Just (21,33)-(21,51)) Minus (Bop (Just (21,34)-(21,45)) Plus (Var (Just (21,35)-(21,38)) "fst") (Var (Just (21,41)-(21,44)) "sec")) (Lit (Just (21,48)-(21,50)) (LI 10)),Lit (Just (21,53)-(21,54)) (LI 1)]) (Tuple (Just (21,61)-(21,77)) [Bop (Just (21,62)-(21,73)) Plus (Var (Just (21,63)-(21,66)) "fst") (Var (Just (21,69)-(21,72)) "sec"),Lit (Just (21,75)-(21,76)) (LI 0)]))] (Let (Just (22,6)-(25,23)) NonRec [(TuplePat (Just (22,11)-(22,23)) [VarPat (Just (22,11)-(22,16)) "carry",VarPat (Just (22,17)-(22,23)) "digits"],Var (Just (22,27)-(22,28)) "a")] (Let (Just (23,6)-(25,23)) NonRec [(TuplePat (Just (23,11)-(23,25)) [VarPat (Just (23,11)-(23,17)) "carry'",VarPat (Just (23,18)-(23,25)) "digits'"],Ite (Just (24,8)-(24,75)) (Bop (Just (24,11)-(24,19)) Eq (Var (Just (24,11)-(24,15)) "sec'") (Lit (Just (24,18)-(24,19)) (LI 1))) (Tuple (Just (24,25)-(24,47)) [Lit (Just (24,26)-(24,27)) (LI 1),App (Just (24,29)-(24,46)) (Var (Just (24,37)-(24,38)) "@") [Var (Just (24,30)-(24,36)) "digits",List (Just (24,39)-(24,45)) [Var (Just (24,40)-(24,44)) "fst'"] Nothing]]) (Tuple (Just (24,53)-(24,75)) [Lit (Just (24,54)-(24,55)) (LI 0),App (Just (24,57)-(24,74)) (Var (Just (24,65)-(24,66)) "@") [Var (Just (24,58)-(24,64)) "digits",List (Just (24,67)-(24,73)) [Var (Just (24,68)-(24,72)) "fst'"] Nothing]]))] (Tuple (Just (25,6)-(25,23)) [Var (Just (25,7)-(25,13)) "carry'",Var (Just (25,15)-(25,22)) "digits'"]))))
List (Just (27,49)-(27,57)) [Tuple (Just (27,50)-(27,56)) [Lit (Just (27,51)-(27,52)) (LI 0),Lit (Just (27,54)-(27,55)) (LI 0)]] Nothing
*)

(* typed spans
(19,6)-(25,23)
(27,49)-(27,57)
*)

(* correct types
(int * int list)
(int * int) list
*)

(* bad types
(int * int)
int list
*)
