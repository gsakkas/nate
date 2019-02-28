
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l = match l with | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match (a, x) with
      | ((b,c),(d,e)) ->
          ((((d + e) + b) / 10), ((((d + e) + b) mod 10) :: c)) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l = (mulByDigit i) - (1 bigAdd l l);;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l = match l with | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match (a, x) with
      | ((b,c),(d,e)) ->
          ((((d + e) + b) / 10), ((((d + e) + b) mod 10) :: c)) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec helper i acc l = if i > 0 then helper i (bigAdd acc l) l else acc in
  helper i [] l;;

*)

(* changed spans
(22,25)-(22,56)
let rec helper =
  fun i ->
    fun acc ->
      fun l ->
        if i > 0
        then helper i (bigAdd acc l) l
        else acc in
helper i [] l
LetG Rec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (23,2)-(24,15)) Rec [(VarPat (Just (23,10)-(23,16)) "helper",Lam (Just (23,17)-(23,75)) (VarPat (Just (23,17)-(23,18)) "i") (Lam (Just (23,19)-(23,75)) (VarPat (Just (23,19)-(23,22)) "acc") (Lam (Just (23,23)-(23,75)) (VarPat (Just (23,23)-(23,24)) "l") (Ite (Just (23,27)-(23,75)) (Bop (Just (23,30)-(23,35)) Gt (Var (Just (23,30)-(23,31)) "i") (Lit (Just (23,34)-(23,35)) (LI 0))) (App (Just (23,41)-(23,66)) (Var (Just (23,41)-(23,47)) "helper") [Var (Just (23,48)-(23,49)) "i",App (Just (23,50)-(23,64)) (Var (Just (23,51)-(23,57)) "bigAdd") [Var (Just (23,58)-(23,61)) "acc",Var (Just (23,62)-(23,63)) "l"],Var (Just (23,65)-(23,66)) "l"]) (Var (Just (23,72)-(23,75)) "acc")) Nothing) Nothing) Nothing)] (App (Just (24,2)-(24,15)) (Var (Just (24,2)-(24,8)) "helper") [Var (Just (24,9)-(24,10)) "i",List (Just (24,11)-(24,13)) [] Nothing,Var (Just (24,14)-(24,15)) "l"])
*)

(* typed spans
(23,2)-(24,15)
*)

(* correct types
int list
*)

(* bad types
int
*)
