
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | (x,y) -> [(0, (x + y))] in
    let base = [] in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (i,j) ->
          (match a with
           | (m,n) ->
               if ((i + j) + m) >= 10
               then (1, ((((i + j) + m) - 10) :: n))
               else (0, (((i + j) + m) :: n))) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(14,16)-(14,54)
match x with
| (i , j) -> match a with
             | (m , n) -> if ((i + j) + m) >= 10
                          then (1 , (((i + j) + m) - 10) :: n)
                          else (0 , ((i + j) + m) :: n)
CaseG VarG (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)]))])

(15,15)-(15,17)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG])

*)

(* changed exprs
Case (Just (15,6)-(21,46)) (Var (Just (15,12)-(15,13)) "x") [(TuplePat (Just (16,9)-(16,12)) [VarPat (Just (16,9)-(16,10)) "i",VarPat (Just (16,11)-(16,12)) "j"],Nothing,Case (Just (17,10)-(21,46)) (Var (Just (17,17)-(17,18)) "a") [(TuplePat (Just (18,14)-(18,17)) [VarPat (Just (18,14)-(18,15)) "m",VarPat (Just (18,16)-(18,17)) "n"],Nothing,Ite (Just (19,15)-(21,45)) (Bop (Just (19,18)-(19,37)) Ge (Bop (Just (19,18)-(19,31)) Plus (Bop (Just (19,19)-(19,26)) Plus (Var (Just (19,20)-(19,21)) "i") (Var (Just (19,24)-(19,25)) "j")) (Var (Just (19,29)-(19,30)) "m")) (Lit (Just (19,35)-(19,37)) (LI 10))) (Tuple (Just (20,20)-(20,52)) [Lit (Just (20,21)-(20,22)) (LI 1),ConApp (Just (20,24)-(20,51)) "::" (Just (Tuple (Just (20,25)-(20,50)) [Bop (Just (20,25)-(20,45)) Minus (Bop (Just (20,26)-(20,39)) Plus (Bop (Just (20,27)-(20,34)) Plus (Var (Just (20,28)-(20,29)) "i") (Var (Just (20,32)-(20,33)) "j")) (Var (Just (20,37)-(20,38)) "m")) (Lit (Just (20,42)-(20,44)) (LI 10)),Var (Just (20,49)-(20,50)) "n"])) Nothing]) (Tuple (Just (21,20)-(21,45)) [Lit (Just (21,21)-(21,22)) (LI 0),ConApp (Just (21,24)-(21,44)) "::" (Just (Tuple (Just (21,25)-(21,43)) [Bop (Just (21,25)-(21,38)) Plus (Bop (Just (21,26)-(21,33)) Plus (Var (Just (21,27)-(21,28)) "i") (Var (Just (21,31)-(21,32)) "j")) (Var (Just (21,36)-(21,37)) "m"),Var (Just (21,42)-(21,43)) "n"])) Nothing]))])]
Tuple (Just (22,15)-(22,22)) [Lit (Just (22,16)-(22,17)) (LI 0),List (Just (22,19)-(22,21)) [] Nothing]
*)

(* typed spans
(15,6)-(21,46)
(22,15)-(22,22)
*)

(* correct types
(int * int list)
(int * int list)
*)

(* bad types
(int * int) list
(int * int) list
*)
