
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone 0 ((List.length l2) - (List.length l1))) @ l1
  else (clone 0 ((List.length l1) - (List.length l2))) @ l2;;

let rec removeZero l =
  let f a x =
    if (List.length a) = 0 then (if x = 0 then [] else [x]) else a @ [x] in
  let base = [] in List.fold_left f base l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | (l1e,l2e) -> let num = l1e + l2e in (num, [7]) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add ((padZero l1 l2) (if l1 > l2 then l1 else l2)));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone 0 ((List.length l2) - (List.length l1))) @ l1
  else (clone 0 ((List.length l1) - (List.length l2))) @ l2;;

let rec removeZero l =
  let f a x =
    if (List.length a) = 0 then (if x = 0 then [] else [x]) else a @ [x] in
  let base = [] in List.fold_left f base l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (l1e,l2e) ->
          (match a with
           | (carry,list) ->
               let num = (l1e + l2e) + carry in ((num mod 9), ([7] @ list))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add ((padZero l1 l2), l2));;

*)

(* changed spans
(16,44)-(16,77)
match a with
| (carry , list) -> (let num =
                       (l1e + l2e) + carry in
                     (num mod 9 , [7] @ list))
CaseG VarG (fromList [(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG)])

(20,18)-(20,64)
(padZero l1 l2 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
Case (Just (19,10)-(21,76)) (Var (Just (19,17)-(19,18)) "a") [(TuplePat (Just (20,14)-(20,24)) [VarPat (Just (20,14)-(20,19)) "carry",VarPat (Just (20,20)-(20,24)) "list"],Nothing,Let (Just (21,15)-(21,75)) NonRec [(VarPat (Just (21,19)-(21,22)) "num",Bop (Just (21,25)-(21,44)) Plus (Bop (Just (21,25)-(21,36)) Plus (Var (Just (21,26)-(21,29)) "l1e") (Var (Just (21,32)-(21,35)) "l2e")) (Var (Just (21,39)-(21,44)) "carry"))] (Tuple (Just (21,48)-(21,75)) [Bop (Just (21,49)-(21,60)) Mod (Var (Just (21,50)-(21,53)) "num") (Lit (Just (21,58)-(21,59)) (LI 9)),App (Just (21,62)-(21,74)) (Var (Just (21,67)-(21,68)) "@") [List (Just (21,63)-(21,66)) [Lit (Just (21,64)-(21,65)) (LI 7)] Nothing,Var (Just (21,69)-(21,73)) "list"]]))]
Tuple (Just (25,18)-(25,39)) [App (Just (25,19)-(25,34)) (Var (Just (25,20)-(25,27)) "padZero") [Var (Just (25,28)-(25,30)) "l1",Var (Just (25,31)-(25,33)) "l2"],Var (Just (25,36)-(25,38)) "l2"]
*)

(* typed spans
(19,10)-(21,76)
(25,18)-(25,39)
*)

(* correct types
(int * int list)
(int list * int list)
*)

(* bad types
(int * int list)
(int list * int list)
*)
