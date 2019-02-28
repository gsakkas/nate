
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if not (h = 0) then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match (a, x) with
      | ((out,sum),[]) -> (0, sum)
      | ((out,sum),(b,c)::l') ->
          let d = (b + c) + out in
          if d < 10 then (0, (d :: sum)) else (1, ((d - 10) :: sum)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if not (h = 0) then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (b,c) ->
          (match a with
           | (carry,sum) ->
               (match sum with
                | [] ->
                    if ((carry + b) + c) < 10
                    then (0, ([carry] @ [(carry + b) + c]))
                    else
                      ((carry + 1),
                        ([carry + 1] @ [((carry + b) + c) mod 10]))
                | h::t ->
                    if ((b + c) + h) < 10
                    then (0, ([0] @ ([(b + c) + h] @ t)))
                    else
                      ((carry + 1),
                        ([((h + b) + c) / 10] @ ([((h + b) + c) mod 10] @ t))))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,6)-(22,68)
match x with
| (b , c) -> match a with
             | (carry , sum) -> match sum with
                                | [] -> if ((carry + b) + c) < 10
                                        then (0 , [carry] @ [(carry + b) + c])
                                        else (carry + 1 , [carry + 1] @ [((carry + b) + c) mod 10])
                                | h :: t -> if ((b + c) + h) < 10
                                            then (0 , [0] @ ([(b + c) + h] @ t))
                                            else (carry + 1 , [((h + b) + c) / 10] @ ([((h + b) + c) mod 10] @ t))
CaseG VarG (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)]))])

*)

(* changed exprs
Case (Just (18,6)-(34,80)) (Var (Just (18,12)-(18,13)) "x") [(TuplePat (Just (19,9)-(19,12)) [VarPat (Just (19,9)-(19,10)) "b",VarPat (Just (19,11)-(19,12)) "c"],Nothing,Case (Just (20,10)-(34,80)) (Var (Just (20,17)-(20,18)) "a") [(TuplePat (Just (21,14)-(21,23)) [VarPat (Just (21,14)-(21,19)) "carry",VarPat (Just (21,20)-(21,23)) "sum"],Nothing,Case (Just (22,15)-(34,79)) (Var (Just (22,22)-(22,25)) "sum") [(ConPat (Just (23,18)-(23,20)) "[]" Nothing,Nothing,Ite (Just (24,20)-(28,67)) (Bop (Just (24,23)-(24,45)) Lt (Bop (Just (24,23)-(24,40)) Plus (Bop (Just (24,24)-(24,35)) Plus (Var (Just (24,25)-(24,30)) "carry") (Var (Just (24,33)-(24,34)) "b")) (Var (Just (24,38)-(24,39)) "c")) (Lit (Just (24,43)-(24,45)) (LI 10))) (Tuple (Just (25,25)-(25,59)) [Lit (Just (25,26)-(25,27)) (LI 0),App (Just (25,29)-(25,58)) (Var (Just (25,38)-(25,39)) "@") [List (Just (25,30)-(25,37)) [Var (Just (25,31)-(25,36)) "carry"] Nothing,List (Just (25,40)-(25,57)) [Bop (Just (25,41)-(25,56)) Plus (Bop (Just (25,41)-(25,52)) Plus (Var (Just (25,42)-(25,47)) "carry") (Var (Just (25,50)-(25,51)) "b")) (Var (Just (25,55)-(25,56)) "c")] Nothing]]) (Tuple (Just (27,22)-(28,67)) [Bop (Just (27,23)-(27,34)) Plus (Var (Just (27,24)-(27,29)) "carry") (Lit (Just (27,32)-(27,33)) (LI 1)),App (Just (28,24)-(28,66)) (Var (Just (28,37)-(28,38)) "@") [List (Just (28,25)-(28,36)) [Bop (Just (28,26)-(28,35)) Plus (Var (Just (28,26)-(28,31)) "carry") (Lit (Just (28,34)-(28,35)) (LI 1))] Nothing,List (Just (28,39)-(28,65)) [Bop (Just (28,40)-(28,64)) Mod (Bop (Just (28,40)-(28,57)) Plus (Bop (Just (28,41)-(28,52)) Plus (Var (Just (28,42)-(28,47)) "carry") (Var (Just (28,50)-(28,51)) "b")) (Var (Just (28,55)-(28,56)) "c")) (Lit (Just (28,62)-(28,64)) (LI 10))] Nothing]])),(ConsPat (Just (29,18)-(29,22)) (VarPat (Just (29,18)-(29,19)) "h") (VarPat (Just (29,21)-(29,22)) "t"),Nothing,Ite (Just (30,20)-(34,78)) (Bop (Just (30,23)-(30,41)) Lt (Bop (Just (30,23)-(30,36)) Plus (Bop (Just (30,24)-(30,31)) Plus (Var (Just (30,25)-(30,26)) "b") (Var (Just (30,29)-(30,30)) "c")) (Var (Just (30,34)-(30,35)) "h")) (Lit (Just (30,39)-(30,41)) (LI 10))) (Tuple (Just (31,25)-(31,57)) [Lit (Just (31,26)-(31,27)) (LI 0),App (Just (31,29)-(31,56)) (Var (Just (31,34)-(31,35)) "@") [List (Just (31,30)-(31,33)) [Lit (Just (31,31)-(31,32)) (LI 0)] Nothing,App (Just (31,36)-(31,55)) (Var (Just (31,51)-(31,52)) "@") [List (Just (31,37)-(31,50)) [Bop (Just (31,38)-(31,49)) Plus (Bop (Just (31,38)-(31,45)) Plus (Var (Just (31,39)-(31,40)) "b") (Var (Just (31,43)-(31,44)) "c")) (Var (Just (31,48)-(31,49)) "h")] Nothing,Var (Just (31,53)-(31,54)) "t"]]]) (Tuple (Just (33,22)-(34,78)) [Bop (Just (33,23)-(33,34)) Plus (Var (Just (33,24)-(33,29)) "carry") (Lit (Just (33,32)-(33,33)) (LI 1)),App (Just (34,24)-(34,77)) (Var (Just (34,46)-(34,47)) "@") [List (Just (34,25)-(34,45)) [Bop (Just (34,26)-(34,44)) Div (Bop (Just (34,26)-(34,39)) Plus (Bop (Just (34,27)-(34,34)) Plus (Var (Just (34,28)-(34,29)) "h") (Var (Just (34,32)-(34,33)) "b")) (Var (Just (34,37)-(34,38)) "c")) (Lit (Just (34,42)-(34,44)) (LI 10))] Nothing,App (Just (34,48)-(34,76)) (Var (Just (34,72)-(34,73)) "@") [List (Just (34,49)-(34,71)) [Bop (Just (34,50)-(34,70)) Mod (Bop (Just (34,50)-(34,63)) Plus (Bop (Just (34,51)-(34,58)) Plus (Var (Just (34,52)-(34,53)) "h") (Var (Just (34,56)-(34,57)) "b")) (Var (Just (34,61)-(34,62)) "c")) (Lit (Just (34,68)-(34,70)) (LI 10))] Nothing,Var (Just (34,74)-(34,75)) "t"]]]))])])]
*)

(* typed spans
(18,6)-(34,80)
*)

(* correct types
(int * int list)
*)

(* bad types
(int * int list)
*)
