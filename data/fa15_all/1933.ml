
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then clone 0 ((List.length l1) - (List.length l2))
  else
    if (List.length l1) < (List.length l2)
    then clone 0 ((List.length l2) - (List.length l1))
    else [];;

let rec removeZero l = failwith "to be implemented";;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "to be implemented" in
    let base = failwith "to be implemented" in
    let args = failwith "to be implemented" in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(6,7)-(6,52)
(l1 , clone 0
            (List.length l1 - List.length l2) @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(9,9)-(9,54)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(9,9)-(9,14)
(@)
VarG

(9,9)-(9,14)
clone 0
      (List.length l2 - List.length l1)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(10,9)-(10,11)
l1
VarG

(12,19)-(12,51)
l2
VarG

(12,19)-(12,51)
(l1 , l2)
TupleG (fromList [VarG])

(12,23)-(12,51)
match l with
| [] -> []
| h :: t -> if h = 0
            then removeZero t
            else h :: t
CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG),(Nothing,ListG EmptyG)])

(12,32)-(12,51)
removeZero
VarG

(14,11)-(20,34)
t
VarG

(14,11)-(20,34)
h :: t
ConAppG (Just (TupleG (fromList [VarG])))

(16,16)-(16,44)
let (x1 , x2) = x in
let (carry , res) = a in
(((x1 + x2) + carry) / 10 , (((x1 + x2) + carry) mod 10) :: res)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(17,15)-(17,43)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG])

(18,24)-(18,43)
List.rev
VarG

(19,4)-(19,51)
List.combine l1 l2
AppG (fromList [VarG])

*)

(* changed exprs
Tuple (Just (6,7)-(6,67)) [Var (Just (6,8)-(6,10)) "l1",App (Just (6,12)-(6,66)) (Var (Just (6,61)-(6,62)) "@") [App (Just (6,13)-(6,60)) (Var (Just (6,14)-(6,19)) "clone") [Lit (Just (6,20)-(6,21)) (LI 0),Bop (Just (6,22)-(6,59)) Minus (App (Just (6,23)-(6,39)) (Var (Just (6,24)-(6,35)) "List.length") [Var (Just (6,36)-(6,38)) "l1"]) (App (Just (6,42)-(6,58)) (Var (Just (6,43)-(6,54)) "List.length") [Var (Just (6,55)-(6,57)) "l2"])],Var (Just (6,63)-(6,65)) "l2"]]
Tuple (Just (9,9)-(9,69)) [App (Just (9,10)-(9,64)) (Var (Just (9,59)-(9,60)) "@") [App (Just (9,11)-(9,58)) (Var (Just (9,12)-(9,17)) "clone") [Lit (Just (9,18)-(9,19)) (LI 0),Bop (Just (9,20)-(9,57)) Minus (App (Just (9,21)-(9,37)) (Var (Just (9,22)-(9,33)) "List.length") [Var (Just (9,34)-(9,36)) "l2"]) (App (Just (9,40)-(9,56)) (Var (Just (9,41)-(9,52)) "List.length") [Var (Just (9,53)-(9,55)) "l1"])],Var (Just (9,61)-(9,63)) "l1"],Var (Just (9,66)-(9,68)) "l2"]
Var (Just (9,59)-(9,60)) "@"
App (Just (9,11)-(9,58)) (Var (Just (9,12)-(9,17)) "clone") [Lit (Just (9,18)-(9,19)) (LI 0),Bop (Just (9,20)-(9,57)) Minus (App (Just (9,21)-(9,37)) (Var (Just (9,22)-(9,33)) "List.length") [Var (Just (9,34)-(9,36)) "l2"]) (App (Just (9,40)-(9,56)) (Var (Just (9,41)-(9,52)) "List.length") [Var (Just (9,53)-(9,55)) "l1"])]
Var (Just (9,61)-(9,63)) "l1"
Var (Just (9,66)-(9,68)) "l2"
Tuple (Just (10,9)-(10,17)) [Var (Just (10,10)-(10,12)) "l1",Var (Just (10,14)-(10,16)) "l2"]
Case (Just (13,2)-(13,74)) (Var (Just (13,8)-(13,9)) "l") [(ConPat (Just (13,17)-(13,19)) "[]" Nothing,Nothing,List (Just (13,23)-(13,25)) [] Nothing),(ConsPat (Just (13,28)-(13,32)) (VarPat (Just (13,28)-(13,29)) "h") (VarPat (Just (13,31)-(13,32)) "t"),Nothing,Ite (Just (13,36)-(13,74)) (Bop (Just (13,39)-(13,44)) Eq (Var (Just (13,39)-(13,40)) "h") (Lit (Just (13,43)-(13,44)) (LI 0))) (App (Just (13,50)-(13,62)) (Var (Just (13,50)-(13,60)) "removeZero") [Var (Just (13,61)-(13,62)) "t"]) (ConApp (Just (13,68)-(13,74)) "::" (Just (Tuple (Just (13,68)-(13,74)) [Var (Just (13,68)-(13,69)) "h",Var (Just (13,73)-(13,74)) "t"])) Nothing))]
Var (Just (13,50)-(13,60)) "removeZero"
Var (Just (13,61)-(13,62)) "t"
ConApp (Just (13,68)-(13,74)) "::" (Just (Tuple (Just (13,68)-(13,74)) [Var (Just (13,68)-(13,69)) "h",Var (Just (13,73)-(13,74)) "t"])) Nothing
Let (Just (18,6)-(20,73)) NonRec [(TuplePat (Just (18,11)-(18,16)) [VarPat (Just (18,11)-(18,13)) "x1",VarPat (Just (18,14)-(18,16)) "x2"],Var (Just (18,20)-(18,21)) "x")] (Let (Just (19,6)-(20,73)) NonRec [(TuplePat (Just (19,11)-(19,20)) [VarPat (Just (19,11)-(19,16)) "carry",VarPat (Just (19,17)-(19,20)) "res"],Var (Just (19,24)-(19,25)) "a")] (Tuple (Just (20,6)-(20,73)) [Bop (Just (20,7)-(20,33)) Div (Bop (Just (20,8)-(20,27)) Plus (Bop (Just (20,9)-(20,18)) Plus (Var (Just (20,10)-(20,12)) "x1") (Var (Just (20,15)-(20,17)) "x2")) (Var (Just (20,21)-(20,26)) "carry")) (Lit (Just (20,30)-(20,32)) (LI 10)),ConApp (Just (20,35)-(20,72)) "::" (Just (Tuple (Just (20,36)-(20,71)) [Bop (Just (20,36)-(20,64)) Mod (Bop (Just (20,37)-(20,56)) Plus (Bop (Just (20,38)-(20,47)) Plus (Var (Just (20,39)-(20,41)) "x1") (Var (Just (20,44)-(20,46)) "x2")) (Var (Just (20,50)-(20,55)) "carry")) (Lit (Just (20,61)-(20,63)) (LI 10)),Var (Just (20,68)-(20,71)) "res"])) Nothing]))
Tuple (Just (21,15)-(21,22)) [Lit (Just (21,16)-(21,17)) (LI 0),List (Just (21,19)-(21,21)) [] Nothing]
Var (Just (22,15)-(22,23)) "List.rev"
App (Just (22,24)-(22,44)) (Var (Just (22,25)-(22,37)) "List.combine") [Var (Just (22,38)-(22,40)) "l1",Var (Just (22,41)-(22,43)) "l2"]
*)

(* typed spans
(6,7)-(6,67)
(9,9)-(9,69)
(9,59)-(9,60)
(9,11)-(9,58)
(9,61)-(9,63)
(9,66)-(9,68)
(10,9)-(10,17)
(13,2)-(13,74)
(13,50)-(13,60)
(13,61)-(13,62)
(13,68)-(13,74)
(18,6)-(20,73)
(21,15)-(21,22)
(22,15)-(22,23)
(22,24)-(22,44)
*)

(* correct types
(int list * int list)
(int list * int list)
int list -> int list -> int list
int list
int list
int list
(int list * int list)
int list
int list -> int list
int list
int list
(int * int list)
(int * int list)
(int * int) list -> (int * int) list
(int * int) list
*)

(* bad types
int list
int list
int -> int -> int list
int -> int -> int list
int list
'a -> 'b
'a -> 'b
'a
string
'a list -> 'b list -> 'c
'a list -> 'b list -> 'c
('a * 'b)
('a * 'b)
string
'a
*)
