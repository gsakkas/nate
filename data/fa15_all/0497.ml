
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,acc) = a in
      let (x1,x2) = x in
      let sum = (x1 + x2) + carry in ((sum / 10), (acc @ (sum mod 10))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,acc) = a in
      let (x1,x2) = x in
      let sum = (x1 + x2) + carry in ((sum / 10), ((sum mod 10) :: acc)) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,50)-(19,70)
(sum mod 10) :: acc
ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG])))

(21,28)-(21,30)
List.rev l1
AppG (fromList [VarG])

(21,31)-(21,33)
List.rev l2
AppG (fromList [VarG])

*)

(* changed exprs
ConApp (Just (19,50)-(19,71)) "::" (Just (Tuple (Just (19,51)-(19,70)) [Bop (Just (19,51)-(19,63)) Mod (Var (Just (19,52)-(19,55)) "sum") (Lit (Just (19,60)-(19,62)) (LI 10)),Var (Just (19,67)-(19,70)) "acc"])) Nothing
App (Just (21,28)-(21,41)) (Var (Just (21,29)-(21,37)) "List.rev") [Var (Just (21,38)-(21,40)) "l1"]
App (Just (21,42)-(21,55)) (Var (Just (21,43)-(21,51)) "List.rev") [Var (Just (21,52)-(21,54)) "l2"]
*)

(* typed spans
(19,50)-(19,71)
(21,28)-(21,41)
(21,42)-(21,55)
*)

(* correct types
int list
int list
int list
*)

(* bad types
int list
int list
int list
*)
