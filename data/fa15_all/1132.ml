
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (c,d) ->
          if (((fst x) + (snd x)) + c) > 9
          then (1, ((((fst x) + (snd x)) + c) mod 10))
          else (0, ((((fst x) + (snd x)) + c) mod 10)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (c,h::t) ->
          if (((fst x) + (snd x)) + c) > 9
          then (1, (((((fst x) + (snd x)) + c) mod 10) :: t))
          else (0, (((((fst x) + (snd x)) + c) mod 10) :: t)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,6)-(22,54)
match a with
| (c , h :: t) -> if ((fst x + snd x) + c) > 9
                  then (1 , (((fst x + snd x) + c) mod 10) :: t)
                  else (0 , (((fst x + snd x) + c) mod 10) :: t)
CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* changed exprs
Case (Just (18,6)-(22,61)) (Var (Just (18,12)-(18,13)) "a") [(TuplePat (Just (19,9)-(19,15)) [VarPat (Just (19,9)-(19,10)) "c",ConsPat (Just (19,11)-(19,15)) (VarPat (Just (19,11)-(19,12)) "h") (VarPat (Just (19,14)-(19,15)) "t")],Nothing,Ite (Just (20,10)-(22,61)) (Bop (Just (20,13)-(20,42)) Gt (Bop (Just (20,13)-(20,38)) Plus (Bop (Just (20,14)-(20,33)) Plus (App (Just (20,15)-(20,22)) (Var (Just (20,16)-(20,19)) "fst") [Var (Just (20,20)-(20,21)) "x"]) (App (Just (20,25)-(20,32)) (Var (Just (20,26)-(20,29)) "snd") [Var (Just (20,30)-(20,31)) "x"])) (Var (Just (20,36)-(20,37)) "c")) (Lit (Just (20,41)-(20,42)) (LI 9))) (Tuple (Just (21,15)-(21,61)) [Lit (Just (21,16)-(21,17)) (LI 1),ConApp (Just (21,19)-(21,60)) "::" (Just (Tuple (Just (21,20)-(21,59)) [Bop (Just (21,20)-(21,54)) Mod (Bop (Just (21,21)-(21,46)) Plus (Bop (Just (21,22)-(21,41)) Plus (App (Just (21,23)-(21,30)) (Var (Just (21,24)-(21,27)) "fst") [Var (Just (21,28)-(21,29)) "x"]) (App (Just (21,33)-(21,40)) (Var (Just (21,34)-(21,37)) "snd") [Var (Just (21,38)-(21,39)) "x"])) (Var (Just (21,44)-(21,45)) "c")) (Lit (Just (21,51)-(21,53)) (LI 10)),Var (Just (21,58)-(21,59)) "t"])) Nothing]) (Tuple (Just (22,15)-(22,61)) [Lit (Just (22,16)-(22,17)) (LI 0),ConApp (Just (22,19)-(22,60)) "::" (Just (Tuple (Just (22,20)-(22,59)) [Bop (Just (22,20)-(22,54)) Mod (Bop (Just (22,21)-(22,46)) Plus (Bop (Just (22,22)-(22,41)) Plus (App (Just (22,23)-(22,30)) (Var (Just (22,24)-(22,27)) "fst") [Var (Just (22,28)-(22,29)) "x"]) (App (Just (22,33)-(22,40)) (Var (Just (22,34)-(22,37)) "snd") [Var (Just (22,38)-(22,39)) "x"])) (Var (Just (22,44)-(22,45)) "c")) (Lit (Just (22,51)-(22,53)) (LI 10)),Var (Just (22,58)-(22,59)) "t"])) Nothing]))]
*)

(* typed spans
(18,6)-(22,61)
*)

(* correct types
(int * int list)
*)

(* bad types
(int * int)
*)
