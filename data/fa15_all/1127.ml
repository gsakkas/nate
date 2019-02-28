
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
      | (a,b) ->
          if (((fst x) + (snd x)) + a) > 9
          then (1, [a; (((fst x) + (snd x)) + a) mod 10])
          else (0, [a; (((fst x) + (snd x)) + a) mod 10])
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
(21,19)-(21,60)
[a ; ((fst x + snd x) + a) mod 10]
ListG VarG

(22,19)-(22,60)
[a ; ((fst x + snd x) + a) mod 10]
ListG VarG

*)

(* changed exprs
List (Just (21,19)-(21,56)) [Var (Just (21,20)-(21,21)) "a",Bop (Just (21,23)-(21,55)) Mod (Bop (Just (21,23)-(21,48)) Plus (Bop (Just (21,24)-(21,43)) Plus (App (Just (21,25)-(21,32)) (Var (Just (21,26)-(21,29)) "fst") [Var (Just (21,30)-(21,31)) "x"]) (App (Just (21,35)-(21,42)) (Var (Just (21,36)-(21,39)) "snd") [Var (Just (21,40)-(21,41)) "x"])) (Var (Just (21,46)-(21,47)) "a")) (Lit (Just (21,53)-(21,55)) (LI 10))] Nothing
List (Just (22,19)-(22,56)) [Var (Just (22,20)-(22,21)) "a",Bop (Just (22,23)-(22,55)) Mod (Bop (Just (22,23)-(22,48)) Plus (Bop (Just (22,24)-(22,43)) Plus (App (Just (22,25)-(22,32)) (Var (Just (22,26)-(22,29)) "fst") [Var (Just (22,30)-(22,31)) "x"]) (App (Just (22,35)-(22,42)) (Var (Just (22,36)-(22,39)) "snd") [Var (Just (22,40)-(22,41)) "x"])) (Var (Just (22,46)-(22,47)) "a")) (Lit (Just (22,53)-(22,55)) (LI 10))] Nothing
*)

(* typed spans
(21,19)-(21,56)
(22,19)-(22,56)
*)

(* correct types
int list
int list
*)

(* bad types
int list
int list
*)
