
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff >= 0
  then (l1, ((clone 0 diff) @ l2))
  else (((clone 0 (abs diff)) @ l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (arg1,arg2) = x in
      match a with
      | (0,_) ->
          if (arg1 + arg2) > 9
          then (1, [(arg1 + arg2) mod 10])
          else (0, [arg1 + arg2])
      | (_,_) ->
          if ((arg1 + arg2) + 1) > 9
          then (1, ([((arg1 + arg2) + 1) mod 10] @ a))
          else (0, (((arg1 + arg2) + 1) :: a)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff >= 0
  then (l1, ((clone 0 diff) @ l2))
  else (((clone 0 (abs diff)) @ l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (arg1,arg2) = x in
      match a with
      | (0,acc) ->
          if (arg1 + arg2) > 9
          then (1, (((arg1 + arg2) mod 10) :: acc))
          else (0, ((arg1 + arg2) :: acc))
      | (0,[]) ->
          if (arg1 + arg2) > 9
          then (1, [(arg1 + arg2) mod 10])
          else (0, [arg1 + arg2])
      | (_,acc) ->
          if ((arg1 + arg2) + 1) > 9
          then (1, ((((arg1 + arg2) + 1) mod 10) :: acc))
          else (0, (((arg1 + arg2) + 1) :: acc)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,6)-(27,46)
match a with
| (0 , acc) -> if (arg1 + arg2) > 9
               then (1 , ((arg1 + arg2) mod 10) :: acc)
               else (0 , (arg1 + arg2) :: acc)
| (0 , []) -> if (arg1 + arg2) > 9
              then (1 , [(arg1 + arg2) mod 10])
              else (0 , [arg1 + arg2])
| (_ , acc) -> if ((arg1 + arg2) + 1) > 9
               then (1 , (((arg1 + arg2) + 1) mod 10) :: acc)
               else (0 , ((arg1 + arg2) + 1) :: acc)
CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* changed exprs
Case (Just (19,6)-(31,48)) (Var (Just (19,12)-(19,13)) "a") [(TuplePat (Just (20,9)-(20,14)) [LitPat (Just (20,9)-(20,10)) (LI 0),VarPat (Just (20,11)-(20,14)) "acc"],Nothing,Ite (Just (21,10)-(23,42)) (Bop (Just (21,13)-(21,30)) Gt (Bop (Just (21,13)-(21,26)) Plus (Var (Just (21,14)-(21,18)) "arg1") (Var (Just (21,21)-(21,25)) "arg2")) (Lit (Just (21,29)-(21,30)) (LI 9))) (Tuple (Just (22,15)-(22,51)) [Lit (Just (22,16)-(22,17)) (LI 1),ConApp (Just (22,19)-(22,50)) "::" (Just (Tuple (Just (22,20)-(22,49)) [Bop (Just (22,20)-(22,42)) Mod (Bop (Just (22,21)-(22,34)) Plus (Var (Just (22,22)-(22,26)) "arg1") (Var (Just (22,29)-(22,33)) "arg2")) (Lit (Just (22,39)-(22,41)) (LI 10)),Var (Just (22,46)-(22,49)) "acc"])) Nothing]) (Tuple (Just (23,15)-(23,42)) [Lit (Just (23,16)-(23,17)) (LI 0),ConApp (Just (23,19)-(23,41)) "::" (Just (Tuple (Just (23,20)-(23,40)) [Bop (Just (23,20)-(23,33)) Plus (Var (Just (23,21)-(23,25)) "arg1") (Var (Just (23,28)-(23,32)) "arg2"),Var (Just (23,37)-(23,40)) "acc"])) Nothing])),(TuplePat (Just (24,9)-(24,13)) [LitPat (Just (24,9)-(24,10)) (LI 0),ConPat (Just (24,11)-(24,13)) "[]" Nothing],Nothing,Ite (Just (25,10)-(27,33)) (Bop (Just (25,13)-(25,30)) Gt (Bop (Just (25,13)-(25,26)) Plus (Var (Just (25,14)-(25,18)) "arg1") (Var (Just (25,21)-(25,25)) "arg2")) (Lit (Just (25,29)-(25,30)) (LI 9))) (Tuple (Just (26,15)-(26,42)) [Lit (Just (26,16)-(26,17)) (LI 1),List (Just (26,19)-(26,41)) [Bop (Just (26,20)-(26,40)) Mod (Bop (Just (26,20)-(26,33)) Plus (Var (Just (26,21)-(26,25)) "arg1") (Var (Just (26,28)-(26,32)) "arg2")) (Lit (Just (26,38)-(26,40)) (LI 10))] Nothing]) (Tuple (Just (27,15)-(27,33)) [Lit (Just (27,16)-(27,17)) (LI 0),List (Just (27,19)-(27,32)) [Bop (Just (27,20)-(27,31)) Plus (Var (Just (27,20)-(27,24)) "arg1") (Var (Just (27,27)-(27,31)) "arg2")] Nothing])),(TuplePat (Just (28,9)-(28,14)) [WildPat (Just (28,9)-(28,10)),VarPat (Just (28,11)-(28,14)) "acc"],Nothing,Ite (Just (29,10)-(31,48)) (Bop (Just (29,13)-(29,36)) Gt (Bop (Just (29,13)-(29,32)) Plus (Bop (Just (29,14)-(29,27)) Plus (Var (Just (29,15)-(29,19)) "arg1") (Var (Just (29,22)-(29,26)) "arg2")) (Lit (Just (29,30)-(29,31)) (LI 1))) (Lit (Just (29,35)-(29,36)) (LI 9))) (Tuple (Just (30,15)-(30,57)) [Lit (Just (30,16)-(30,17)) (LI 1),ConApp (Just (30,19)-(30,56)) "::" (Just (Tuple (Just (30,20)-(30,55)) [Bop (Just (30,20)-(30,48)) Mod (Bop (Just (30,21)-(30,40)) Plus (Bop (Just (30,22)-(30,35)) Plus (Var (Just (30,23)-(30,27)) "arg1") (Var (Just (30,30)-(30,34)) "arg2")) (Lit (Just (30,38)-(30,39)) (LI 1))) (Lit (Just (30,45)-(30,47)) (LI 10)),Var (Just (30,52)-(30,55)) "acc"])) Nothing]) (Tuple (Just (31,15)-(31,48)) [Lit (Just (31,16)-(31,17)) (LI 0),ConApp (Just (31,19)-(31,47)) "::" (Just (Tuple (Just (31,20)-(31,46)) [Bop (Just (31,20)-(31,39)) Plus (Bop (Just (31,21)-(31,34)) Plus (Var (Just (31,22)-(31,26)) "arg1") (Var (Just (31,29)-(31,33)) "arg2")) (Lit (Just (31,37)-(31,38)) (LI 1)),Var (Just (31,43)-(31,46)) "acc"])) Nothing]))]
*)

(* typed spans
(19,6)-(31,48)
*)

(* correct types
(int * int list)
*)

(* bad types
(int * int list)
*)
