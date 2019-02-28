
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) > (List.length l2)
    then
      (let y = (clone 0 ((List.length l1) - (List.length l2))) @ l2 in
       (l1, y))
    else
      (let z = (clone 0 ((List.length l2) - (List.length l1))) @ l1 in
       (z, l2));;

let rec removeZero l =
  match l with | x::xs -> if x = 0 then removeZero xs else l | [] -> [];;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "tba" in
    let base = [] in
    let args = failwith "to be implemented" in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) > (List.length l2)
    then
      (let y = (clone 0 ((List.length l1) - (List.length l2))) @ l2 in
       (l1, y))
    else
      (let z = (clone 0 ((List.length l2) - (List.length l1))) @ l1 in
       (z, l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (d1,d2) ->
          (match a with
           | (carry,result) ->
               if ((d1 + d2) + carry) > 9
               then (1, ((((d1 + d2) + 1) - 10) :: result))
               else (0, ((d1 + d2) :: result))) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(17,2)-(17,71)
match l with
| [] -> []
| h :: t -> if h = 0
            then removeZero t
            else l
CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG),(Nothing,ListG EmptyG)])

(21,16)-(21,30)
match x with
| (d1 , d2) -> match a with
               | (carry , result) -> if ((d1 + d2) + carry) > 9
                                     then (1 , (((d1 + d2) + 1) - 10) :: result)
                                     else (0 , (d1 + d2) :: result)
CaseG VarG (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)]))])

(22,15)-(22,17)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG])

(23,15)-(23,43)
List.combine (List.rev l1)
             (List.rev l2)
AppG (fromList [AppG (fromList [EmptyG])])

(23,24)-(23,43)
List.rev
VarG

(24,4)-(24,51)
l1
VarG

(24,4)-(24,51)
List.rev l2
AppG (fromList [VarG])

*)

(* changed exprs
Case (Just (17,2)-(17,69)) (Var (Just (17,8)-(17,9)) "l") [(ConPat (Just (17,17)-(17,19)) "[]" Nothing,Nothing,List (Just (17,23)-(17,25)) [] Nothing),(ConsPat (Just (17,28)-(17,32)) (VarPat (Just (17,28)-(17,29)) "h") (VarPat (Just (17,31)-(17,32)) "t"),Nothing,Ite (Just (17,36)-(17,69)) (Bop (Just (17,39)-(17,44)) Eq (Var (Just (17,39)-(17,40)) "h") (Lit (Just (17,43)-(17,44)) (LI 0))) (App (Just (17,50)-(17,62)) (Var (Just (17,50)-(17,60)) "removeZero") [Var (Just (17,61)-(17,62)) "t"]) (Var (Just (17,68)-(17,69)) "l"))]
Case (Just (22,6)-(28,47)) (Var (Just (22,12)-(22,13)) "x") [(TuplePat (Just (23,9)-(23,14)) [VarPat (Just (23,9)-(23,11)) "d1",VarPat (Just (23,12)-(23,14)) "d2"],Nothing,Case (Just (24,10)-(28,47)) (Var (Just (24,17)-(24,18)) "a") [(TuplePat (Just (25,14)-(25,26)) [VarPat (Just (25,14)-(25,19)) "carry",VarPat (Just (25,20)-(25,26)) "result"],Nothing,Ite (Just (26,15)-(28,46)) (Bop (Just (26,18)-(26,41)) Gt (Bop (Just (26,18)-(26,37)) Plus (Bop (Just (26,19)-(26,28)) Plus (Var (Just (26,20)-(26,22)) "d1") (Var (Just (26,25)-(26,27)) "d2")) (Var (Just (26,31)-(26,36)) "carry")) (Lit (Just (26,40)-(26,41)) (LI 9))) (Tuple (Just (27,20)-(27,59)) [Lit (Just (27,21)-(27,22)) (LI 1),ConApp (Just (27,24)-(27,58)) "::" (Just (Tuple (Just (27,25)-(27,57)) [Bop (Just (27,25)-(27,47)) Minus (Bop (Just (27,26)-(27,41)) Plus (Bop (Just (27,27)-(27,36)) Plus (Var (Just (27,28)-(27,30)) "d1") (Var (Just (27,33)-(27,35)) "d2")) (Lit (Just (27,39)-(27,40)) (LI 1))) (Lit (Just (27,44)-(27,46)) (LI 10)),Var (Just (27,51)-(27,57)) "result"])) Nothing]) (Tuple (Just (28,20)-(28,46)) [Lit (Just (28,21)-(28,22)) (LI 0),ConApp (Just (28,24)-(28,45)) "::" (Just (Tuple (Just (28,25)-(28,44)) [Bop (Just (28,25)-(28,34)) Plus (Var (Just (28,26)-(28,28)) "d1") (Var (Just (28,31)-(28,33)) "d2"),Var (Just (28,38)-(28,44)) "result"])) Nothing]))])]
Tuple (Just (29,15)-(29,22)) [Lit (Just (29,16)-(29,17)) (LI 0),List (Just (29,19)-(29,21)) [] Nothing]
App (Just (30,15)-(30,55)) (Var (Just (30,15)-(30,27)) "List.combine") [App (Just (30,28)-(30,41)) (Var (Just (30,29)-(30,37)) "List.rev") [Var (Just (30,38)-(30,40)) "l1"],App (Just (30,42)-(30,55)) (Var (Just (30,43)-(30,51)) "List.rev") [Var (Just (30,52)-(30,54)) "l2"]]
Var (Just (30,29)-(30,37)) "List.rev"
Var (Just (30,38)-(30,40)) "l1"
App (Just (30,42)-(30,55)) (Var (Just (30,43)-(30,51)) "List.rev") [Var (Just (30,52)-(30,54)) "l2"]
*)

(* typed spans
(17,2)-(17,69)
(22,6)-(28,47)
(29,15)-(29,22)
(30,15)-(30,55)
(30,29)-(30,37)
(30,38)-(30,40)
(30,42)-(30,55)
*)

(* correct types
int list
(int * int list)
(int * int list)
(int * int) list
int list -> int list
int list
int list
*)

(* bad types
int list
'a list
'a list
'a list
string
int list
int list
*)
