
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff > 0
  then (l1, ((clone 0 diff) @ l2))
  else if diff < 0 then (((clone 0 (diff * (-1))) @ l1), l2) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::l' -> if h = 0 then removeZero l' else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (n1,n2) = x in
      let sum = n1 + n2 in
      match a with
      | [] -> if sum > 9 then [1; sum - 1] else [0; sum]
      | c::x' ->
          if (sum + c) > 9
          then 1 :: ((sum + c) - 10) :: x'
          else (sum + c) :: x' in
    let base = [] in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff > 0
  then (l1, ((clone 0 diff) @ l2))
  else if diff < 0 then (((clone 0 (diff * (-1))) @ l1), l2) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::l' -> if h = 0 then removeZero l' else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (n1,n2) = x in
      let sum = n1 + n2 in
      match a with
      | [] -> [sum]
      | c::x' -> if c > 9 then (sum + 1) :: (c - 10) :: x' else sum :: a in
    let base = [] in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,14)-(19,56)
[sum]
ListG VarG

(21,13)-(21,22)
c
VarG

(22,15)-(22,42)
sum + 1
BopG VarG LitG

(22,21)-(22,30)
c
VarG

(23,15)-(23,24)
sum
VarG

(23,28)-(23,30)
a
VarG

(26,4)-(26,51)
let res =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) VarG

*)

(* changed exprs
List (Just (19,14)-(19,19)) [Var (Just (19,15)-(19,18)) "sum"] Nothing
Var (Just (20,20)-(20,21)) "c"
Bop (Just (20,31)-(20,40)) Plus (Var (Just (20,32)-(20,35)) "sum") (Lit (Just (20,38)-(20,39)) (LI 1))
Var (Just (20,45)-(20,46)) "c"
Var (Just (20,64)-(20,67)) "sum"
Var (Just (20,71)-(20,72)) "a"
Let (Just (23,4)-(23,47)) NonRec [(VarPat (Just (23,8)-(23,11)) "res",App (Just (23,14)-(23,40)) (Var (Just (23,14)-(23,28)) "List.fold_left") [Var (Just (23,29)-(23,30)) "f",Var (Just (23,31)-(23,35)) "base",Var (Just (23,36)-(23,40)) "args"])] (Var (Just (23,44)-(23,47)) "res")
*)

(* typed spans
(19,14)-(19,19)
(20,20)-(20,21)
(20,31)-(20,40)
(20,45)-(20,46)
(20,64)-(20,67)
(20,71)-(20,72)
(23,4)-(23,47)
*)

(* correct types
int list
int
int
int
int
int list
int list
*)

(* bad types
int list
int
int list
int
int
int list
int list
*)
