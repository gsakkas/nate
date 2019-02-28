
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (y,z) = x in (y + z) @ a in
    let base = [] in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      if let (carry,ans) = a in let (y,z) = x in ((y + z) + carry) > 9
      then
        let (carry,ans) = a in
        (1, (let (y,z) = x in [((y + z) + carry) mod 10] @ ans))
      else
        (let (carry,ans) = a in
         (0, (let (y,z) = x in [(y + z) + carry] @ ans))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(14,16)-(14,44)
if (let (carry , ans) = a in
    let (y , z) = x in
    ((y + z) + carry) > 9)
then (let (carry , ans) = a in
      (1 , let (y , z) = x in
           [((y + z) + carry) mod 10] @ ans))
else (let (carry , ans) = a in
      (0 , let (y , z) = x in
           [(y + z) + carry] @ ans))
IteG (LetG NonRec (fromList [EmptyG]) EmptyG) (LetG NonRec (fromList [EmptyG]) EmptyG) (LetG NonRec (fromList [EmptyG]) EmptyG)

(15,15)-(15,17)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG])

*)

(* changed exprs
Ite (Just (15,6)-(21,57)) (Let (Just (15,9)-(15,70)) NonRec [(TuplePat (Just (15,14)-(15,23)) [VarPat (Just (15,14)-(15,19)) "carry",VarPat (Just (15,20)-(15,23)) "ans"],Var (Just (15,27)-(15,28)) "a")] (Let (Just (15,32)-(15,70)) NonRec [(TuplePat (Just (15,37)-(15,40)) [VarPat (Just (15,37)-(15,38)) "y",VarPat (Just (15,39)-(15,40)) "z"],Var (Just (15,44)-(15,45)) "x")] (Bop (Just (15,49)-(15,70)) Gt (Bop (Just (15,49)-(15,66)) Plus (Bop (Just (15,50)-(15,57)) Plus (Var (Just (15,51)-(15,52)) "y") (Var (Just (15,55)-(15,56)) "z")) (Var (Just (15,60)-(15,65)) "carry")) (Lit (Just (15,69)-(15,70)) (LI 9))))) (Let (Just (17,8)-(18,64)) NonRec [(TuplePat (Just (17,13)-(17,22)) [VarPat (Just (17,13)-(17,18)) "carry",VarPat (Just (17,19)-(17,22)) "ans"],Var (Just (17,26)-(17,27)) "a")] (Tuple (Just (18,8)-(18,64)) [Lit (Just (18,9)-(18,10)) (LI 1),Let (Just (18,12)-(18,63)) NonRec [(TuplePat (Just (18,18)-(18,21)) [VarPat (Just (18,18)-(18,19)) "y",VarPat (Just (18,20)-(18,21)) "z"],Var (Just (18,25)-(18,26)) "x")] (App (Just (18,30)-(18,62)) (Var (Just (18,57)-(18,58)) "@") [List (Just (18,30)-(18,56)) [Bop (Just (18,31)-(18,55)) Mod (Bop (Just (18,31)-(18,48)) Plus (Bop (Just (18,32)-(18,39)) Plus (Var (Just (18,33)-(18,34)) "y") (Var (Just (18,37)-(18,38)) "z")) (Var (Just (18,42)-(18,47)) "carry")) (Lit (Just (18,53)-(18,55)) (LI 10))] Nothing,Var (Just (18,59)-(18,62)) "ans"])])) (Let (Just (20,8)-(21,57)) NonRec [(TuplePat (Just (20,14)-(20,23)) [VarPat (Just (20,14)-(20,19)) "carry",VarPat (Just (20,20)-(20,23)) "ans"],Var (Just (20,27)-(20,28)) "a")] (Tuple (Just (21,9)-(21,56)) [Lit (Just (21,10)-(21,11)) (LI 0),Let (Just (21,13)-(21,55)) NonRec [(TuplePat (Just (21,19)-(21,22)) [VarPat (Just (21,19)-(21,20)) "y",VarPat (Just (21,21)-(21,22)) "z"],Var (Just (21,26)-(21,27)) "x")] (App (Just (21,31)-(21,54)) (Var (Just (21,49)-(21,50)) "@") [List (Just (21,31)-(21,48)) [Bop (Just (21,32)-(21,47)) Plus (Bop (Just (21,32)-(21,39)) Plus (Var (Just (21,33)-(21,34)) "y") (Var (Just (21,37)-(21,38)) "z")) (Var (Just (21,42)-(21,47)) "carry")] Nothing,Var (Just (21,51)-(21,54)) "ans"])]))
Tuple (Just (22,15)-(22,22)) [Lit (Just (22,16)-(22,17)) (LI 0),List (Just (22,19)-(22,21)) [] Nothing]
*)

(* typed spans
(15,6)-(21,57)
(22,15)-(22,22)
*)

(* correct types
(int * int list)
(int * int list)
*)

(* bad types
'a list
'a list
*)
