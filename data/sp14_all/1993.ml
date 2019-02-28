
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let shorter = if len1 < len2 then l1 else l2 in
  let zeros = if shorter = l1 then len2 - len1 else len1 - len2 in
  if shorter = l1
  then ((List.append (clone 0 zeros) shorter), l2)
  else (l1, (List.append (clone 0 zeros) shorter));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (m,n)::[] ->
          if (m + n) > 9 then 1 :: ((m + n) - 10) :: a else (m + n) :: a in
    let base = [] in
    let args = match List.rev (List.combine l1 l2) with | h::t -> h in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let shorter = if len1 < len2 then l1 else l2 in
  let zeros = if shorter = l1 then len2 - len1 else len1 - len2 in
  if shorter = l1
  then ((List.append (clone 0 zeros) shorter), l2)
  else (l1, (List.append (clone 0 zeros) shorter));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let prevN (n1,n2) = n1 in
      let prev = prevN a in
      let sumlist (p1,p2) = p2 in
      let sum = sumlist a in
      let add (m,n) = m + n in
      let digit = (add x) + prev in
      if digit > 10 then (1, ((digit - 10) :: sum)) else (0, (digit :: sum)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,6)-(21,72)
let prevN =
  fun (n1 , n2) -> n1 in
let prev = prevN a in
let sumlist =
  fun (p1 , p2) -> p2 in
let sum = sumlist a in
let add =
  fun (m , n) -> m + n in
let digit = add x + prev in
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
LetG NonRec (fromList [LamG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(22,15)-(22,17)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG])

(23,15)-(23,67)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(23,15)-(23,67)
List.rev
VarG

(23,15)-(23,67)
List.combine l1 l2
AppG (fromList [VarG])

(23,15)-(23,67)
List.combine
VarG

(23,15)-(23,67)
l1
VarG

(23,15)-(23,67)
l2
VarG

*)

(* changed exprs
Let (Just (19,6)-(25,76)) NonRec [(VarPat (Just (19,10)-(19,15)) "prevN",Lam (Just (19,17)-(19,28)) (TuplePat (Just (19,17)-(19,22)) [VarPat (Just (19,17)-(19,19)) "n1",VarPat (Just (19,20)-(19,22)) "n2"]) (Var (Just (19,26)-(19,28)) "n1") Nothing)] (Let (Just (20,6)-(25,76)) NonRec [(VarPat (Just (20,10)-(20,14)) "prev",App (Just (20,17)-(20,24)) (Var (Just (20,17)-(20,22)) "prevN") [Var (Just (20,23)-(20,24)) "a"])] (Let (Just (21,6)-(25,76)) NonRec [(VarPat (Just (21,10)-(21,17)) "sumlist",Lam (Just (21,19)-(21,30)) (TuplePat (Just (21,19)-(21,24)) [VarPat (Just (21,19)-(21,21)) "p1",VarPat (Just (21,22)-(21,24)) "p2"]) (Var (Just (21,28)-(21,30)) "p2") Nothing)] (Let (Just (22,6)-(25,76)) NonRec [(VarPat (Just (22,10)-(22,13)) "sum",App (Just (22,16)-(22,25)) (Var (Just (22,16)-(22,23)) "sumlist") [Var (Just (22,24)-(22,25)) "a"])] (Let (Just (23,6)-(25,76)) NonRec [(VarPat (Just (23,10)-(23,13)) "add",Lam (Just (23,15)-(23,27)) (TuplePat (Just (23,15)-(23,18)) [VarPat (Just (23,15)-(23,16)) "m",VarPat (Just (23,17)-(23,18)) "n"]) (Bop (Just (23,22)-(23,27)) Plus (Var (Just (23,22)-(23,23)) "m") (Var (Just (23,26)-(23,27)) "n")) Nothing)] (Let (Just (24,6)-(25,76)) NonRec [(VarPat (Just (24,10)-(24,15)) "digit",Bop (Just (24,18)-(24,32)) Plus (App (Just (24,18)-(24,25)) (Var (Just (24,19)-(24,22)) "add") [Var (Just (24,23)-(24,24)) "x"]) (Var (Just (24,28)-(24,32)) "prev"))] (Ite (Just (25,6)-(25,76)) (Bop (Just (25,9)-(25,19)) Gt (Var (Just (25,9)-(25,14)) "digit") (Lit (Just (25,17)-(25,19)) (LI 10))) (Tuple (Just (25,25)-(25,51)) [Lit (Just (25,26)-(25,27)) (LI 1),ConApp (Just (25,29)-(25,50)) "::" (Just (Tuple (Just (25,30)-(25,49)) [Bop (Just (25,30)-(25,42)) Minus (Var (Just (25,31)-(25,36)) "digit") (Lit (Just (25,39)-(25,41)) (LI 10)),Var (Just (25,46)-(25,49)) "sum"])) Nothing]) (Tuple (Just (25,57)-(25,76)) [Lit (Just (25,58)-(25,59)) (LI 0),ConApp (Just (25,61)-(25,75)) "::" (Just (Tuple (Just (25,62)-(25,74)) [Var (Just (25,62)-(25,67)) "digit",Var (Just (25,71)-(25,74)) "sum"])) Nothing])))))))
Tuple (Just (26,15)-(26,22)) [Lit (Just (26,16)-(26,17)) (LI 0),List (Just (26,19)-(26,21)) [] Nothing]
App (Just (27,15)-(27,44)) (Var (Just (27,15)-(27,23)) "List.rev") [App (Just (27,24)-(27,44)) (Var (Just (27,25)-(27,37)) "List.combine") [Var (Just (27,38)-(27,40)) "l1",Var (Just (27,41)-(27,43)) "l2"]]
Var (Just (27,15)-(27,23)) "List.rev"
App (Just (27,24)-(27,44)) (Var (Just (27,25)-(27,37)) "List.combine") [Var (Just (27,38)-(27,40)) "l1",Var (Just (27,41)-(27,43)) "l2"]
Var (Just (27,25)-(27,37)) "List.combine"
Var (Just (27,38)-(27,40)) "l1"
Var (Just (27,41)-(27,43)) "l2"
*)

(* typed spans
(19,6)-(25,76)
(26,15)-(26,22)
(27,15)-(27,44)
(27,15)-(27,23)
(27,24)-(27,44)
(27,25)-(27,37)
(27,38)-(27,40)
(27,41)-(27,43)
*)

(* correct types
(int * int list)
(int * int list)
(int * int) list
(int * int) list -> (int * int) list
(int * int) list
int list -> int list -> (int * int) list
int list
int list
*)

(* bad types
int list
int list
(int * int)
(int * int)
(int * int)
(int * int)
(int * int)
(int * int)
*)
