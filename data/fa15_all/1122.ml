
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
      | h::t ->
          if (((fst x) + (snd x)) + h) > 9
          then (1, (((((fst x) + (snd x)) + h) mod 10) :: t))
          else (0, (((((fst x) + (snd x)) + h) mod 10) :: t))
      | _ ->
          if ((fst x) + (snd x)) > 9
          then (1, (((fst x) + (snd x)) mod 10))
          else (0, (((fst x) + (snd x)) mod 10)) in
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
      | (a,b) ->
          if (((fst x) + (snd x)) + a) > 9
          then (1, (((((fst x) + (snd x)) + a) mod 10) :: b))
          else (0, (((((fst x) + (snd x)) + a) mod 10) :: b))
      | _ ->
          if ((fst x) + (snd x)) > 9
          then (1, [((fst x) + (snd x)) mod 10])
          else (0, [((fst x) + (snd x)) mod 10]) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,6)-(26,48)
match a with
| (a , b) -> if ((fst x + snd x) + a) > 9
             then (1 , (((fst x + snd x) + a) mod 10) :: b)
             else (0 , (((fst x + snd x) + a) mod 10) :: b)
| _ -> if (fst x + snd x) > 9
       then (1 , [(fst x + snd x) mod 10])
       else (0 , [(fst x + snd x) mod 10])
CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* changed exprs
Case (Just (18,6)-(26,48)) (Var (Just (18,12)-(18,13)) "a") [(TuplePat (Just (19,9)-(19,12)) [VarPat (Just (19,9)-(19,10)) "a",VarPat (Just (19,11)-(19,12)) "b"],Nothing,Ite (Just (20,10)-(22,61)) (Bop (Just (20,13)-(20,42)) Gt (Bop (Just (20,13)-(20,38)) Plus (Bop (Just (20,14)-(20,33)) Plus (App (Just (20,15)-(20,22)) (Var (Just (20,16)-(20,19)) "fst") [Var (Just (20,20)-(20,21)) "x"]) (App (Just (20,25)-(20,32)) (Var (Just (20,26)-(20,29)) "snd") [Var (Just (20,30)-(20,31)) "x"])) (Var (Just (20,36)-(20,37)) "a")) (Lit (Just (20,41)-(20,42)) (LI 9))) (Tuple (Just (21,15)-(21,61)) [Lit (Just (21,16)-(21,17)) (LI 1),ConApp (Just (21,19)-(21,60)) "::" (Just (Tuple (Just (21,20)-(21,59)) [Bop (Just (21,20)-(21,54)) Mod (Bop (Just (21,21)-(21,46)) Plus (Bop (Just (21,22)-(21,41)) Plus (App (Just (21,23)-(21,30)) (Var (Just (21,24)-(21,27)) "fst") [Var (Just (21,28)-(21,29)) "x"]) (App (Just (21,33)-(21,40)) (Var (Just (21,34)-(21,37)) "snd") [Var (Just (21,38)-(21,39)) "x"])) (Var (Just (21,44)-(21,45)) "a")) (Lit (Just (21,51)-(21,53)) (LI 10)),Var (Just (21,58)-(21,59)) "b"])) Nothing]) (Tuple (Just (22,15)-(22,61)) [Lit (Just (22,16)-(22,17)) (LI 0),ConApp (Just (22,19)-(22,60)) "::" (Just (Tuple (Just (22,20)-(22,59)) [Bop (Just (22,20)-(22,54)) Mod (Bop (Just (22,21)-(22,46)) Plus (Bop (Just (22,22)-(22,41)) Plus (App (Just (22,23)-(22,30)) (Var (Just (22,24)-(22,27)) "fst") [Var (Just (22,28)-(22,29)) "x"]) (App (Just (22,33)-(22,40)) (Var (Just (22,34)-(22,37)) "snd") [Var (Just (22,38)-(22,39)) "x"])) (Var (Just (22,44)-(22,45)) "a")) (Lit (Just (22,51)-(22,53)) (LI 10)),Var (Just (22,58)-(22,59)) "b"])) Nothing])),(WildPat (Just (23,8)-(23,9)),Nothing,Ite (Just (24,10)-(26,48)) (Bop (Just (24,13)-(24,36)) Gt (Bop (Just (24,13)-(24,32)) Plus (App (Just (24,14)-(24,21)) (Var (Just (24,15)-(24,18)) "fst") [Var (Just (24,19)-(24,20)) "x"]) (App (Just (24,24)-(24,31)) (Var (Just (24,25)-(24,28)) "snd") [Var (Just (24,29)-(24,30)) "x"])) (Lit (Just (24,35)-(24,36)) (LI 9))) (Tuple (Just (25,15)-(25,48)) [Lit (Just (25,16)-(25,17)) (LI 1),List (Just (25,19)-(25,47)) [Bop (Just (25,20)-(25,46)) Mod (Bop (Just (25,20)-(25,39)) Plus (App (Just (25,21)-(25,28)) (Var (Just (25,22)-(25,25)) "fst") [Var (Just (25,26)-(25,27)) "x"]) (App (Just (25,31)-(25,38)) (Var (Just (25,32)-(25,35)) "snd") [Var (Just (25,36)-(25,37)) "x"])) (Lit (Just (25,44)-(25,46)) (LI 10))] Nothing]) (Tuple (Just (26,15)-(26,48)) [Lit (Just (26,16)-(26,17)) (LI 0),List (Just (26,19)-(26,47)) [Bop (Just (26,20)-(26,46)) Mod (Bop (Just (26,20)-(26,39)) Plus (App (Just (26,21)-(26,28)) (Var (Just (26,22)-(26,25)) "fst") [Var (Just (26,26)-(26,27)) "x"]) (App (Just (26,31)-(26,38)) (Var (Just (26,32)-(26,35)) "snd") [Var (Just (26,36)-(26,37)) "x"])) (Lit (Just (26,44)-(26,46)) (LI 10))] Nothing]))]
*)

(* typed spans
(18,6)-(26,48)
*)

(* correct types
(int * int list)
*)

(* bad types
(int * int list)
*)
