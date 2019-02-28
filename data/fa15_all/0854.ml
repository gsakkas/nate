
let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n ->
      if n < 0
      then (((clone 0 (n * (-1))) @ l1), l2)
      else (((clone 0 n) @ l2), l1);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (fst,sec) = x in
      let (fst',sec') =
        if (fst + sec) > 9 then (((fst + sec) - 10), 1) else ((fst + sec), 0) in
      let (carry,digits) = a in
      let (carry',digits') =
        if sec' = 1
        then (1, ([(fst', sec')] @ digits))
        else (0, ([(fst', sec')] @ digits)) in
      (carry', digits') in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add ((padZero l1), l2));;


(* fix

let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n ->
      if n < 0
      then (((clone 0 (n * (-1))) @ l1), l2)
      else (((clone 0 n) @ l2), l1);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (fst,sec) = x in
      let (fst',sec') =
        if (fst + sec) > 9 then (((fst + sec) - 10), 1) else ((fst + sec), 0) in
      let (carry,digits) = a in
      let (carry',digits') =
        if sec' = 1 then (1, (digits @ [fst'])) else (0, (digits @ [fst'])) in
      (carry', digits') in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(25,18)-(25,32)
digits
VarG

(25,19)-(25,31)
fst'
VarG

(26,33)-(26,34)
digits
VarG

(26,19)-(26,31)
fst'
VarG

(31,18)-(31,36)
padZero l1 l2
AppG (fromList [VarG])

*)

(* changed exprs
Var (Just (24,30)-(24,36)) "digits"
Var (Just (24,40)-(24,44)) "fst'"
Var (Just (24,58)-(24,64)) "digits"
Var (Just (24,68)-(24,72)) "fst'"
App (Just (29,18)-(29,33)) (Var (Just (29,19)-(29,26)) "padZero") [Var (Just (29,27)-(29,29)) "l1",Var (Just (29,30)-(29,32)) "l2"]
*)

(* typed spans
(24,30)-(24,36)
(24,40)-(24,44)
(24,58)-(24,64)
(24,68)-(24,72)
(29,18)-(29,33)
*)

(* correct types
int list
int
int list
int
(int list * int list)
*)

(* bad types
(int * int) list
(int * int)
(int * int) list -> (int * int) list -> (int * int) list
(int * int)
(int list -> (int list * int list) * 'a)
*)
