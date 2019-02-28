
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
      | hd::tl -> ((((fst x) + (snd x)) + hd) / 10) ::
          ((((fst x) + (snd x)) + hd) mod 10) :: tl
      | _ -> (((fst x) + (snd x)) / 10) :: (((fst x) + (snd x)) mod 10) in
    let base = [] in
    let args = List.combine l1 l2 in List.fold_left f base args in
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
      | hd::tl -> ((((fst x) + (snd x)) + hd) / 10) ::
          ((((fst x) + (snd x)) + hd) mod 10) :: tl
      | _ -> (((fst x) + (snd x)) / 10) :: (((fst x) + (snd x)) mod 10) :: a in
    let base = [] in
    let args = List.combine l1 l2 in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(21,43)-(21,71)
((fst x + snd x) mod 10) :: a
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (AppG (fromList [VarG])) (AppG (fromList [VarG]))) LitG])))

*)

(* changed exprs
ConApp (Just (21,43)-(21,76)) "::" (Just (Tuple (Just (21,43)-(21,76)) [Bop (Just (21,43)-(21,71)) Mod (Bop (Just (21,44)-(21,63)) Plus (App (Just (21,45)-(21,52)) (Var (Just (21,46)-(21,49)) "fst") [Var (Just (21,50)-(21,51)) "x"]) (App (Just (21,55)-(21,62)) (Var (Just (21,56)-(21,59)) "snd") [Var (Just (21,60)-(21,61)) "x"])) (Lit (Just (21,68)-(21,70)) (LI 10)),Var (Just (21,75)-(21,76)) "a"])) Nothing
*)

(* typed spans
(21,43)-(21,76)
*)

(* correct types
int list
*)

(* bad types
int
*)
