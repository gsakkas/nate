
let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n < 0 then (((clone 0 (- n)) @ l1), l2) else (l1, ((clone 0 n) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      if ((a1 + x1) + x2) >= 10
      then (1, (a2 @ (((a1 + x1) + x2) - 10)))
      else (0, (a2 @ ((a1 + x1) + x2))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n < 0 then (((clone 0 (- n)) @ l1), l2) else (l1, ((clone 0 n) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      if ((a1 + x1) + x2) >= 10
      then (1, (a2 @ [((a1 + x1) + x2) - 10]))
      else (0, (a2 @ [(a1 + x1) + x2])) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,21)-(18,44)
[((a1 + x1) + x2) - 10]
ListG (BopG EmptyG EmptyG)

(19,21)-(19,37)
[(a1 + x1) + x2]
ListG (BopG EmptyG EmptyG)

*)

(* changed exprs
List (Just (18,21)-(18,44)) [Bop (Just (18,22)-(18,43)) Minus (Bop (Just (18,22)-(18,38)) Plus (Bop (Just (18,23)-(18,32)) Plus (Var (Just (18,24)-(18,26)) "a1") (Var (Just (18,29)-(18,31)) "x1")) (Var (Just (18,35)-(18,37)) "x2")) (Lit (Just (18,41)-(18,43)) (LI 10))] Nothing
List (Just (19,21)-(19,37)) [Bop (Just (19,22)-(19,36)) Plus (Bop (Just (19,22)-(19,31)) Plus (Var (Just (19,23)-(19,25)) "a1") (Var (Just (19,28)-(19,30)) "x1")) (Var (Just (19,34)-(19,36)) "x2")] Nothing
*)

(* typed spans
(18,21)-(18,44)
(19,21)-(19,37)
*)

(* correct types
int list
int list
*)

(* bad types
int
int
*)
