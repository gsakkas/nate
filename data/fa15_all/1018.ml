
let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then let z = x - y in (l1, ((clone 0 z) @ l2))
  else (let z = y - x in (((clone 0 z) @ l1), l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a + x in
    let base = 0 in
    let args = l1 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then let z = x - y in (l1, ((clone 0 z) @ l2))
  else (let z = y - x in (((clone 0 z) @ l1), l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (y,z) = a in
      let (r,s) = x in let m = (r + s) + y in ((m / 10), ((m mod 10) :: z)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,16)-(19,21)
let (y , z) = a in
let (r , s) = x in
let m = (r + s) + y in
(m / 10 , (m mod 10) :: z)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(19,16)-(19,17)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG])

(19,20)-(19,21)
[]
ListG EmptyG

(20,4)-(21,68)
List.combine l1 l2
AppG (fromList [VarG])

(20,15)-(20,16)
l2
VarG

*)

(* changed exprs
Let (Just (20,6)-(21,75)) NonRec [(TuplePat (Just (20,11)-(20,14)) [VarPat (Just (20,11)-(20,12)) "y",VarPat (Just (20,13)-(20,14)) "z"],Var (Just (20,18)-(20,19)) "a")] (Let (Just (21,6)-(21,75)) NonRec [(TuplePat (Just (21,11)-(21,14)) [VarPat (Just (21,11)-(21,12)) "r",VarPat (Just (21,13)-(21,14)) "s"],Var (Just (21,18)-(21,19)) "x")] (Let (Just (21,23)-(21,75)) NonRec [(VarPat (Just (21,27)-(21,28)) "m",Bop (Just (21,31)-(21,42)) Plus (Bop (Just (21,31)-(21,38)) Plus (Var (Just (21,32)-(21,33)) "r") (Var (Just (21,36)-(21,37)) "s")) (Var (Just (21,41)-(21,42)) "y"))] (Tuple (Just (21,46)-(21,75)) [Bop (Just (21,47)-(21,55)) Div (Var (Just (21,48)-(21,49)) "m") (Lit (Just (21,52)-(21,54)) (LI 10)),ConApp (Just (21,57)-(21,74)) "::" (Just (Tuple (Just (21,58)-(21,73)) [Bop (Just (21,58)-(21,68)) Mod (Var (Just (21,59)-(21,60)) "m") (Lit (Just (21,65)-(21,67)) (LI 10)),Var (Just (21,72)-(21,73)) "z"])) Nothing])))
Tuple (Just (22,15)-(22,22)) [Lit (Just (22,16)-(22,17)) (LI 0),List (Just (22,19)-(22,21)) [] Nothing]
List (Just (22,19)-(22,21)) [] Nothing
App (Just (23,15)-(23,33)) (Var (Just (23,15)-(23,27)) "List.combine") [Var (Just (23,28)-(23,30)) "l1",Var (Just (23,31)-(23,33)) "l2"]
Var (Just (23,31)-(23,33)) "l2"
*)

(* typed spans
(20,6)-(21,75)
(22,15)-(22,22)
(22,19)-(22,21)
(23,15)-(23,33)
(23,31)-(23,33)
*)

(* correct types
(int * int list)
(int * int list)
int list
(int * int) list
int list
*)

(* bad types
int
int
int
int list
int
*)
