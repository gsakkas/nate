
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | h::t -> if h = 0 then removeZero t else l | _ -> [];;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = (fst x) + (snd x) in
      match a with
      | h::t -> ((h + sum) / 10) :: ((h + sum) mod 10) :: t
      | _ -> [sum / 10; sum mod 10] in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | h::t -> if h = 0 then removeZero t else l | _ -> [];;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = (fst x) + (snd x) in
      match a with
      | h::t -> ((h + sum) / 10) :: ((h + sum) mod 10) :: t
      | _ -> [sum / 10; sum mod 10] in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(24,4)-(24,51)
List.fold_left f base args
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (23,48)-(23,74)) (Var (Just (23,48)-(23,62)) "List.fold_left") [Var (Just (23,63)-(23,64)) "f",Var (Just (23,65)-(23,69)) "base",Var (Just (23,70)-(23,74)) "args"]
*)

(* typed spans
(23,48)-(23,74)
*)

(* correct types
int list
*)

(* bad types
int list
*)
