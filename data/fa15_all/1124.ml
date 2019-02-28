
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
      | (a,h::t) ->
          if (((fst x) + (snd x)) + a) > 9
          then (1, (a :: ((((fst x) + (snd x)) + a) mod 10)))
          else (0, (a :: ((((fst x) + (snd x)) + a) mod 10)))
      | _ ->
          if ((fst x) + (snd x)) > 9
          then (1, [((fst x) + (snd x)) mod 10])
          else (0, [((fst x) + (snd x)) mod 10]) in
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
      | (a,h::t) ->
          if (((fst x) + (snd x)) + a) > 9
          then (1, (a :: ((((fst x) + (snd x)) + a) mod 10) :: t))
          else (0, (a :: ((((fst x) + (snd x)) + a) mod 10) :: t))
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
(21,25)-(21,59)
(((fst x + snd x) + a) mod 10) :: t
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG (AppG (fromList [VarG])) (AppG (fromList [VarG]))) VarG) LitG])))

(22,25)-(22,59)
(((fst x + snd x) + a) mod 10) :: t
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG (AppG (fromList [VarG])) (AppG (fromList [VarG]))) VarG) LitG])))

(24,10)-(26,48)
t
VarG

*)

(* changed exprs
ConApp (Just (21,25)-(21,64)) "::" (Just (Tuple (Just (21,25)-(21,64)) [Bop (Just (21,25)-(21,59)) Mod (Bop (Just (21,26)-(21,51)) Plus (Bop (Just (21,27)-(21,46)) Plus (App (Just (21,28)-(21,35)) (Var (Just (21,29)-(21,32)) "fst") [Var (Just (21,33)-(21,34)) "x"]) (App (Just (21,38)-(21,45)) (Var (Just (21,39)-(21,42)) "snd") [Var (Just (21,43)-(21,44)) "x"])) (Var (Just (21,49)-(21,50)) "a")) (Lit (Just (21,56)-(21,58)) (LI 10)),Var (Just (21,63)-(21,64)) "t"])) Nothing
ConApp (Just (22,25)-(22,64)) "::" (Just (Tuple (Just (22,25)-(22,64)) [Bop (Just (22,25)-(22,59)) Mod (Bop (Just (22,26)-(22,51)) Plus (Bop (Just (22,27)-(22,46)) Plus (App (Just (22,28)-(22,35)) (Var (Just (22,29)-(22,32)) "fst") [Var (Just (22,33)-(22,34)) "x"]) (App (Just (22,38)-(22,45)) (Var (Just (22,39)-(22,42)) "snd") [Var (Just (22,43)-(22,44)) "x"])) (Var (Just (22,49)-(22,50)) "a")) (Lit (Just (22,56)-(22,58)) (LI 10)),Var (Just (22,63)-(22,64)) "t"])) Nothing
Var (Just (22,63)-(22,64)) "t"
*)

(* typed spans
(21,25)-(21,64)
(22,25)-(22,64)
(22,63)-(22,64)
*)

(* correct types
int list
int list
int list
*)

(* bad types
int
int
(int * int list)
*)
