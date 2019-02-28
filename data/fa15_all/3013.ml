
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let d = (List.length l1) - (List.length l2) in
  if d < 0 then (((clone 0 (0 - d)) @ l1), l2) else (l1, ((clone 0 d) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (j,k) = x in
      let (l,m) = a in
      if ((j + k) + l) > 9
      then (1, ((((j + k) + l) - 10) :: m))
      else (0, (((j + k) + l) :: m)) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (c,res) = List.fold_left f base args in c :: res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> 0 | 1 -> l | x -> (mulByDigit i) - (1 (bigAdd l l));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let d = (List.length l1) - (List.length l2) in
  if d < 0 then (((clone 0 (0 - d)) @ l1), l2) else (l1, ((clone 0 d) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (j,k) = x in
      let (l,m) = a in
      if ((j + k) + l) > 9
      then (1, ((((j + k) + l) - 10) :: m))
      else (0, (((j + k) + l) :: m)) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (c,res) = List.fold_left f base args in c :: res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> [0] | 1 -> l | x -> mulByDigit (i - 1) (bigAdd l l);;

*)

(* changed spans
(25,22)-(25,23)
[0]
ListG LitG

(25,40)-(25,73)
mulByDigit (i - 1) (bigAdd l
                           l)
AppG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* changed exprs
List (Just (25,22)-(25,25)) [Lit (Just (25,23)-(25,24)) (LI 0)] Nothing
App (Just (25,42)-(25,73)) (Var (Just (25,42)-(25,52)) "mulByDigit") [Bop (Just (25,53)-(25,60)) Minus (Var (Just (25,54)-(25,55)) "i") (Lit (Just (25,58)-(25,59)) (LI 1)),App (Just (25,61)-(25,73)) (Var (Just (25,62)-(25,68)) "bigAdd") [Var (Just (25,69)-(25,70)) "l",Var (Just (25,71)-(25,72)) "l"]]
*)

(* typed spans
(25,22)-(25,25)
(25,42)-(25,73)
*)

(* correct types
int list
int list
*)

(* bad types
int
int
*)
