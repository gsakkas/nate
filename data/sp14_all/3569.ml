
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
  let rec helper i acc l =
    if i > 0 then (helper i) - (1 (bigAdd acc l) l) else acc in
  helper i [] l;;


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
  let rec helper i acc l =
    if i > 0 then helper (i - 1) (bigAdd acc l) l else acc in
  helper i [] l;;

*)

(* changed spans
(24,18)-(24,51)
helper (i - 1) (bigAdd acc l)
       l
AppG (fromList [VarG,AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (24,18)-(24,49)) (Var (Just (24,18)-(24,24)) "helper") [Bop (Just (24,25)-(24,32)) Minus (Var (Just (24,26)-(24,27)) "i") (Lit (Just (24,30)-(24,31)) (LI 1)),App (Just (24,33)-(24,47)) (Var (Just (24,34)-(24,40)) "bigAdd") [Var (Just (24,41)-(24,44)) "acc",Var (Just (24,45)-(24,46)) "l"],Var (Just (24,48)-(24,49)) "l"]
*)

(* typed spans
(24,18)-(24,49)
*)

(* correct types
int list
*)

(* bad types
int
*)
