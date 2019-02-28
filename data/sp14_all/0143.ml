
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,num) = a in
      let (l1',l2') = x in
      let addit = (l1' + l2') + carry in
      ((if addit >= 10 then 1 else 0), (num @ [addit mod 10])) in
    let base = (0, []) in
    let args = List.combine [0; l1] [0; l2] in
    let (car,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,num) = a in
      let (l1',l2') = x in
      let addit = (l1' + l2') + carry in
      ((if addit >= 10 then 1 else 0), (num @ [addit mod 10])) in
    let base = (0, []) in
    let args = List.combine ([0] @ l1) ([0] @ l2) in
    let (car,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,28)-(19,35)
[0] @ l1
AppG (fromList [VarG,ListG EmptyG])

(19,36)-(19,43)
[0] @ l2
AppG (fromList [VarG,ListG EmptyG])

*)

(* changed exprs
App (Just (19,28)-(19,38)) (Var (Just (19,33)-(19,34)) "@") [List (Just (19,29)-(19,32)) [Lit (Just (19,30)-(19,31)) (LI 0)] Nothing,Var (Just (19,35)-(19,37)) "l1"]
App (Just (19,39)-(19,49)) (Var (Just (19,44)-(19,45)) "@") [List (Just (19,40)-(19,43)) [Lit (Just (19,41)-(19,42)) (LI 0)] Nothing,Var (Just (19,46)-(19,48)) "l2"]
*)

(* typed spans
(19,28)-(19,38)
(19,39)-(19,49)
*)

(* correct types
int list
int list
*)

(* bad types
int list
int list
*)
