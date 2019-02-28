
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
          else (0, (((((fst x) + (snd x)) + c) mod 10) :: t))
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
      | (c,h::t) ->
          if (((fst x) + (snd x)) + c) > 9
          then (1, (((((fst x) + (snd x)) + c) mod 10) :: t))
          else (0, (((((fst x) + (snd x)) + c) mod 10) :: t))
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
(25,19)-(25,47)
[(fst x + snd x) mod 10]
ListG (BopG EmptyG EmptyG)

(26,19)-(26,47)
[(fst x + snd x) mod 10]
ListG (BopG EmptyG EmptyG)

*)

(* changed exprs
List (Just (25,19)-(25,47)) [Bop (Just (25,20)-(25,46)) Mod (Bop (Just (25,20)-(25,39)) Plus (App (Just (25,21)-(25,28)) (Var (Just (25,22)-(25,25)) "fst") [Var (Just (25,26)-(25,27)) "x"]) (App (Just (25,31)-(25,38)) (Var (Just (25,32)-(25,35)) "snd") [Var (Just (25,36)-(25,37)) "x"])) (Lit (Just (25,44)-(25,46)) (LI 10))] Nothing
List (Just (26,19)-(26,47)) [Bop (Just (26,20)-(26,46)) Mod (Bop (Just (26,20)-(26,39)) Plus (App (Just (26,21)-(26,28)) (Var (Just (26,22)-(26,25)) "fst") [Var (Just (26,26)-(26,27)) "x"]) (App (Just (26,31)-(26,38)) (Var (Just (26,32)-(26,35)) "snd") [Var (Just (26,36)-(26,37)) "x"])) (Lit (Just (26,44)-(26,46)) (LI 10))] Nothing
*)

(* typed spans
(25,19)-(25,47)
(26,19)-(26,47)
*)

(* correct types
int list
int list
*)

(* bad types
int
int
*)
