
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t when h == 0 -> removeZero t | h::t -> h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | (x,y) -> x + y in
    let base = [] in
    let args = List.combine (l1, l2) in
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
  match l with | [] -> [] | h::t when h == 0 -> removeZero t | h::t -> h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (w,z) ->
          (match x with
           | (x,y) -> ((((x + y) + w) / 10), ((((x + y) + w) mod 10) :: z))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,4)-(19,51)
match a with
| (w , z) -> match x with
             | (x , y) -> (((x + y) + w) / 10 , (((x + y) + w) mod 10) :: z)
CaseG VarG (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)]))])

(16,40)-(16,41)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG])

(18,15)-(18,36)
List.combine l1 l2
AppG (fromList [VarG])

*)

(* changed exprs
Case (Just (17,6)-(20,76)) (Var (Just (17,12)-(17,13)) "a") [(TuplePat (Just (18,9)-(18,12)) [VarPat (Just (18,9)-(18,10)) "w",VarPat (Just (18,11)-(18,12)) "z"],Nothing,Case (Just (19,10)-(20,76)) (Var (Just (19,17)-(19,18)) "x") [(TuplePat (Just (20,14)-(20,17)) [VarPat (Just (20,14)-(20,15)) "x",VarPat (Just (20,16)-(20,17)) "y"],Nothing,Tuple (Just (20,22)-(20,75)) [Bop (Just (20,23)-(20,43)) Div (Bop (Just (20,24)-(20,37)) Plus (Bop (Just (20,25)-(20,32)) Plus (Var (Just (20,26)-(20,27)) "x") (Var (Just (20,30)-(20,31)) "y")) (Var (Just (20,35)-(20,36)) "w")) (Lit (Just (20,40)-(20,42)) (LI 10)),ConApp (Just (20,45)-(20,74)) "::" (Just (Tuple (Just (20,46)-(20,73)) [Bop (Just (20,46)-(20,68)) Mod (Bop (Just (20,47)-(20,60)) Plus (Bop (Just (20,48)-(20,55)) Plus (Var (Just (20,49)-(20,50)) "x") (Var (Just (20,53)-(20,54)) "y")) (Var (Just (20,58)-(20,59)) "w")) (Lit (Just (20,65)-(20,67)) (LI 10)),Var (Just (20,72)-(20,73)) "z"])) Nothing])])]
Tuple (Just (21,15)-(21,22)) [Lit (Just (21,16)-(21,17)) (LI 0),List (Just (21,19)-(21,21)) [] Nothing]
App (Just (22,15)-(22,33)) (Var (Just (22,15)-(22,27)) "List.combine") [Var (Just (22,28)-(22,30)) "l1",Var (Just (22,31)-(22,33)) "l2"]
*)

(* typed spans
(17,6)-(20,76)
(21,15)-(21,22)
(22,15)-(22,33)
*)

(* correct types
(int * int list)
(int * int list)
(int * int) list
*)

(* bad types
int list
int
'a
*)
