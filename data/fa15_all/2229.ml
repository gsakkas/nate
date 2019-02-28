
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference = (List.length l1) - (List.length l2) in
  if difference > 0
  then (l1, ((clone 0 difference) @ l2))
  else
    if difference < 0
    then (((clone 0 ((-1) * difference)) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "to be implemented" in
    let base = [0] in
    let args =
      let combine (a,b) = a + b in
      List.map combine (List.rev (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference = (List.length l1) - (List.length l2) in
  if difference > 0
  then (l1, ((clone 0 difference) @ l2))
  else
    if difference < 0
    then (((clone 0 ((-1) * difference)) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match a with | (o,[]) -> (o, [x]) | (o,l) -> (o, (x :: l)) in
    let base = (0, []) in
    let args =
      let combine (a,b) = a + b in
      List.map combine (List.rev (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,4)-(23,51)
match a with
| (o , []) -> (o , [x])
| (o , l) -> (o , x :: l)
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(19,16)-(19,17)
let base = (0 , []) in
let args =
  (let combine =
     fun (a , b) -> a + b in
   List.map combine
            (List.rev (List.combine l1
                                    l2))) in
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [TupleG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(20,4)-(23,51)
[]
ListG EmptyG

*)

(* changed exprs
Case (Just (18,16)-(18,74)) (Var (Just (18,22)-(18,23)) "a") [(TuplePat (Just (18,32)-(18,36)) [VarPat (Just (18,32)-(18,33)) "o",ConPat (Just (18,34)-(18,36)) "[]" Nothing],Nothing,Tuple (Just (18,41)-(18,49)) [Var (Just (18,42)-(18,43)) "o",List (Just (18,45)-(18,48)) [Var (Just (18,46)-(18,47)) "x"] Nothing]),(TuplePat (Just (18,53)-(18,56)) [VarPat (Just (18,53)-(18,54)) "o",VarPat (Just (18,55)-(18,56)) "l"],Nothing,Tuple (Just (18,61)-(18,74)) [Var (Just (18,62)-(18,63)) "o",ConApp (Just (18,65)-(18,73)) "::" (Just (Tuple (Just (18,66)-(18,72)) [Var (Just (18,66)-(18,67)) "x",Var (Just (18,71)-(18,72)) "l"])) Nothing])]
Let (Just (19,4)-(23,51)) NonRec [(VarPat (Just (19,8)-(19,12)) "base",Tuple (Just (19,15)-(19,22)) [Lit (Just (19,16)-(19,17)) (LI 0),List (Just (19,19)-(19,21)) [] Nothing])] (Let (Just (20,4)-(23,51)) NonRec [(VarPat (Just (20,8)-(20,12)) "args",Let (Just (21,6)-(22,54)) NonRec [(VarPat (Just (21,10)-(21,17)) "combine",Lam (Just (21,19)-(21,31)) (TuplePat (Just (21,19)-(21,22)) [VarPat (Just (21,19)-(21,20)) "a",VarPat (Just (21,21)-(21,22)) "b"]) (Bop (Just (21,26)-(21,31)) Plus (Var (Just (21,26)-(21,27)) "a") (Var (Just (21,30)-(21,31)) "b")) Nothing)] (App (Just (22,6)-(22,54)) (Var (Just (22,6)-(22,14)) "List.map") [Var (Just (22,15)-(22,22)) "combine",App (Just (22,23)-(22,54)) (Var (Just (22,24)-(22,32)) "List.rev") [App (Just (22,33)-(22,53)) (Var (Just (22,34)-(22,46)) "List.combine") [Var (Just (22,47)-(22,49)) "l1",Var (Just (22,50)-(22,52)) "l2"]]]))] (Let (Just (23,4)-(23,51)) NonRec [(TuplePat (Just (23,9)-(23,14)) [WildPat (Just (23,9)-(23,10)),VarPat (Just (23,11)-(23,14)) "res"],App (Just (23,18)-(23,44)) (Var (Just (23,18)-(23,32)) "List.fold_left") [Var (Just (23,33)-(23,34)) "f",Var (Just (23,35)-(23,39)) "base",Var (Just (23,40)-(23,44)) "args"])] (Var (Just (23,48)-(23,51)) "res")))
List (Just (19,19)-(19,21)) [] Nothing
*)

(* typed spans
(18,16)-(18,74)
(19,4)-(23,51)
(19,19)-(19,21)
*)

(* correct types
(int * int list)
int list
int list
*)

(* bad types
int list
int
int list
*)
