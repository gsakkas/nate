
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
      if addit >= 10 then 1 else (0, (num @ [addit mod 10])) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
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
    let args = List.combine l1 l2 in
    let (car,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(17,6)-(17,60)
(if addit >= 10
 then 1
 else 0 , num @ [addit mod 10])
TupleG (fromList [AppG (fromList [EmptyG]),IteG EmptyG EmptyG EmptyG])

*)

(* changed exprs
Tuple (Just (17,6)-(17,62)) [Ite (Just (17,7)-(17,37)) (Bop (Just (17,11)-(17,22)) Ge (Var (Just (17,11)-(17,16)) "addit") (Lit (Just (17,20)-(17,22)) (LI 10))) (Lit (Just (17,28)-(17,29)) (LI 1)) (Lit (Just (17,35)-(17,36)) (LI 0)),App (Just (17,39)-(17,61)) (Var (Just (17,44)-(17,45)) "@") [Var (Just (17,40)-(17,43)) "num",List (Just (17,46)-(17,60)) [Bop (Just (17,47)-(17,59)) Mod (Var (Just (17,47)-(17,52)) "addit") (Lit (Just (17,57)-(17,59)) (LI 10))] Nothing]]
*)

(* typed spans
(17,6)-(17,62)
*)

(* correct types
(int * int list)
*)

(* bad types
(int * int list)
*)
