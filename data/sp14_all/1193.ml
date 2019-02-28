
let rec clone x n =
  let rec helper a x n =
    if n <= 0 then a else (let a' = x :: a in helper a' x (n - 1)) in
  helper [] x n;;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 > length2
  then (l1, (List.append (clone 0 (length1 - length2)) l2))
  else
    if length2 > length1
    then ((List.append (clone 0 (length2 - length1)) l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "to be implemented" in
    let base = 0 in
    let args =
      let rec pair list1 list2 =
        match (list1, list2) with
        | (h1::t1,h2::t2) -> (h1, h2) :: (pair (t1, t2))
        | ([],[]) -> [] in
      pair l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec helper a x n =
    if n <= 0 then a else (let a' = x :: a in helper a' x (n - 1)) in
  helper [] x n;;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 > length2
  then (l1, (List.append (clone 0 (length1 - length2)) l2))
  else
    if length2 > length1
    then ((List.append (clone 0 (length2 - length1)) l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (x1,x2) ->
          (match a with
           | (o,z) ->
               if ((o + x1) + x2) > 9
               then (1, ((((o + x1) + x2) mod 10) :: z))
               else (0, (((o + x1) + x2) :: z))) in
    let base = (0, []) in
    let args =
      let rec pair list1 list2 =
        match ((List.rev list1), (List.rev list2)) with
        | (h1::t1,h2::t2) -> (h1, h2) :: (pair t1 t2)
        | (_,_) -> [] in
      pair l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(22,16)-(22,44)
match x with
| (x1 , x2) -> match a with
               | (o , z) -> if ((o + x1) + x2) > 9
                            then (1 , (((o + x1) + x2) mod 10) :: z)
                            else (0 , ((o + x1) + x2) :: z)
CaseG VarG (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)]))])

(23,15)-(23,16)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG])

(24,4)-(30,51)
[]
ListG EmptyG

(26,8)-(28,23)
match (List.rev list1 , List.rev list2) with
| (h1 :: t1 , h2 :: t2) -> (h1 , h2) :: (pair t1
                                              t2)
| (_ , _) -> []
CaseG (TupleG (fromList [EmptyG])) (fromList [(Nothing,ConAppG (Just EmptyG)),(Nothing,ListG EmptyG)])

*)

(* changed exprs
Case (Just (23,6)-(29,48)) (Var (Just (23,12)-(23,13)) "x") [(TuplePat (Just (24,9)-(24,14)) [VarPat (Just (24,9)-(24,11)) "x1",VarPat (Just (24,12)-(24,14)) "x2"],Nothing,Case (Just (25,10)-(29,48)) (Var (Just (25,17)-(25,18)) "a") [(TuplePat (Just (26,14)-(26,17)) [VarPat (Just (26,14)-(26,15)) "o",VarPat (Just (26,16)-(26,17)) "z"],Nothing,Ite (Just (27,15)-(29,47)) (Bop (Just (27,18)-(27,37)) Gt (Bop (Just (27,18)-(27,33)) Plus (Bop (Just (27,19)-(27,27)) Plus (Var (Just (27,20)-(27,21)) "o") (Var (Just (27,24)-(27,26)) "x1")) (Var (Just (27,30)-(27,32)) "x2")) (Lit (Just (27,36)-(27,37)) (LI 9))) (Tuple (Just (28,20)-(28,56)) [Lit (Just (28,21)-(28,22)) (LI 1),ConApp (Just (28,24)-(28,55)) "::" (Just (Tuple (Just (28,25)-(28,54)) [Bop (Just (28,25)-(28,49)) Mod (Bop (Just (28,26)-(28,41)) Plus (Bop (Just (28,27)-(28,35)) Plus (Var (Just (28,28)-(28,29)) "o") (Var (Just (28,32)-(28,34)) "x1")) (Var (Just (28,38)-(28,40)) "x2")) (Lit (Just (28,46)-(28,48)) (LI 10)),Var (Just (28,53)-(28,54)) "z"])) Nothing]) (Tuple (Just (29,20)-(29,47)) [Lit (Just (29,21)-(29,22)) (LI 0),ConApp (Just (29,24)-(29,46)) "::" (Just (Tuple (Just (29,25)-(29,45)) [Bop (Just (29,25)-(29,40)) Plus (Bop (Just (29,26)-(29,34)) Plus (Var (Just (29,27)-(29,28)) "o") (Var (Just (29,31)-(29,33)) "x1")) (Var (Just (29,37)-(29,39)) "x2"),Var (Just (29,44)-(29,45)) "z"])) Nothing]))])]
Tuple (Just (30,15)-(30,22)) [Lit (Just (30,16)-(30,17)) (LI 0),List (Just (30,19)-(30,21)) [] Nothing]
List (Just (30,19)-(30,21)) [] Nothing
Case (Just (33,8)-(35,21)) (Tuple (Just (33,14)-(33,50)) [App (Just (33,15)-(33,31)) (Var (Just (33,16)-(33,24)) "List.rev") [Var (Just (33,25)-(33,30)) "list1"],App (Just (33,33)-(33,49)) (Var (Just (33,34)-(33,42)) "List.rev") [Var (Just (33,43)-(33,48)) "list2"]]) [(TuplePat (Just (34,11)-(34,24)) [ConsPat (Just (34,11)-(34,17)) (VarPat (Just (34,11)-(34,13)) "h1") (VarPat (Just (34,15)-(34,17)) "t1"),ConsPat (Just (34,18)-(34,24)) (VarPat (Just (34,18)-(34,20)) "h2") (VarPat (Just (34,22)-(34,24)) "t2")],Nothing,ConApp (Just (34,29)-(34,53)) "::" (Just (Tuple (Just (34,29)-(34,53)) [Tuple (Just (34,29)-(34,37)) [Var (Just (34,30)-(34,32)) "h1",Var (Just (34,34)-(34,36)) "h2"],App (Just (34,41)-(34,53)) (Var (Just (34,42)-(34,46)) "pair") [Var (Just (34,47)-(34,49)) "t1",Var (Just (34,50)-(34,52)) "t2"]])) Nothing),(TuplePat (Just (35,11)-(35,14)) [WildPat (Just (35,11)-(35,12)),WildPat (Just (35,13)-(35,14))],Nothing,List (Just (35,19)-(35,21)) [] Nothing)]
*)

(* typed spans
(23,6)-(29,48)
(30,15)-(30,22)
(30,19)-(30,21)
(33,8)-(35,21)
*)

(* correct types
(int * int list)
(int * int list)
int list
(int * int) list
*)

(* bad types
int
int
'a
('a * 'b) list
*)
