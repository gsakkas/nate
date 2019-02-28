
let rec clone x n = if n > 0 then List.append [x] (clone x (n - 1)) else [];;

let padZero l1 l2 =
  ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1),
    (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | _ -> let h::t = l in (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2)::t = x in
      if (x1 + x2) > 9
      then (1, ((x1 + x2) - 10)) :: a
      else (0, (x1 + x2)) :: a in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then List.append [x] (clone x (n - 1)) else [];;

let padZero l1 l2 =
  ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1),
    (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | _ -> let h::t = l in (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (a1,a2) = a in
      let (x1,x2) = x in
      let val1 = (a1 + x1) + x2 in
      let val2 = (x1 + x2) / 10 in (val2, (val1 :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,6)-(19,30)
let (a1 , a2) = a in
let (x1 , x2) = x in
let val1 = (a1 + x1) + x2 in
let val2 = (x1 + x2) / 10 in
(val2 , val1 :: a2)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(19,11)-(19,25)
let base = (0 , []) in
let args =
  List.rev (List.combine l1
                         l2) in
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [TupleG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(20,4)-(22,51)
[]
ListG EmptyG

(20,4)-(22,51)
let args =
  List.rev (List.combine l1
                         l2) in
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(20,4)-(22,51)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(20,4)-(22,51)
List.rev
VarG

(20,4)-(22,51)
List.combine l1 l2
AppG (fromList [VarG])

(20,4)-(22,51)
List.combine
VarG

(20,4)-(22,51)
l1
VarG

(20,4)-(22,51)
l2
VarG

(20,4)-(22,51)
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) VarG

(20,4)-(22,51)
List.fold_left f base args
AppG (fromList [VarG])

(20,4)-(22,51)
List.fold_left
VarG

(20,4)-(22,51)
f
VarG

(20,4)-(22,51)
base
VarG

(20,4)-(22,51)
args
VarG

(20,4)-(22,51)
res
VarG

*)

(* changed exprs
Let (Just (16,6)-(19,55)) NonRec [(TuplePat (Just (16,11)-(16,16)) [VarPat (Just (16,11)-(16,13)) "a1",VarPat (Just (16,14)-(16,16)) "a2"],Var (Just (16,20)-(16,21)) "a")] (Let (Just (17,6)-(19,55)) NonRec [(TuplePat (Just (17,11)-(17,16)) [VarPat (Just (17,11)-(17,13)) "x1",VarPat (Just (17,14)-(17,16)) "x2"],Var (Just (17,20)-(17,21)) "x")] (Let (Just (18,6)-(19,55)) NonRec [(VarPat (Just (18,10)-(18,14)) "val1",Bop (Just (18,17)-(18,31)) Plus (Bop (Just (18,17)-(18,26)) Plus (Var (Just (18,18)-(18,20)) "a1") (Var (Just (18,23)-(18,25)) "x1")) (Var (Just (18,29)-(18,31)) "x2"))] (Let (Just (19,6)-(19,55)) NonRec [(VarPat (Just (19,10)-(19,14)) "val2",Bop (Just (19,17)-(19,31)) Div (Bop (Just (19,17)-(19,26)) Plus (Var (Just (19,18)-(19,20)) "x1") (Var (Just (19,23)-(19,25)) "x2")) (Lit (Just (19,29)-(19,31)) (LI 10)))] (Tuple (Just (19,35)-(19,55)) [Var (Just (19,36)-(19,40)) "val2",ConApp (Just (19,42)-(19,54)) "::" (Just (Tuple (Just (19,43)-(19,53)) [Var (Just (19,43)-(19,47)) "val1",Var (Just (19,51)-(19,53)) "a2"])) Nothing]))))
Let (Just (20,4)-(22,51)) NonRec [(VarPat (Just (20,8)-(20,12)) "base",Tuple (Just (20,15)-(20,22)) [Lit (Just (20,16)-(20,17)) (LI 0),List (Just (20,19)-(20,21)) [] Nothing])] (Let (Just (21,4)-(22,51)) NonRec [(VarPat (Just (21,8)-(21,12)) "args",App (Just (21,15)-(21,44)) (Var (Just (21,15)-(21,23)) "List.rev") [App (Just (21,24)-(21,44)) (Var (Just (21,25)-(21,37)) "List.combine") [Var (Just (21,38)-(21,40)) "l1",Var (Just (21,41)-(21,43)) "l2"]])] (Let (Just (22,4)-(22,51)) NonRec [(TuplePat (Just (22,9)-(22,14)) [WildPat (Just (22,9)-(22,10)),VarPat (Just (22,11)-(22,14)) "res"],App (Just (22,18)-(22,44)) (Var (Just (22,18)-(22,32)) "List.fold_left") [Var (Just (22,33)-(22,34)) "f",Var (Just (22,35)-(22,39)) "base",Var (Just (22,40)-(22,44)) "args"])] (Var (Just (22,48)-(22,51)) "res")))
List (Just (20,19)-(20,21)) [] Nothing
Let (Just (21,4)-(22,51)) NonRec [(VarPat (Just (21,8)-(21,12)) "args",App (Just (21,15)-(21,44)) (Var (Just (21,15)-(21,23)) "List.rev") [App (Just (21,24)-(21,44)) (Var (Just (21,25)-(21,37)) "List.combine") [Var (Just (21,38)-(21,40)) "l1",Var (Just (21,41)-(21,43)) "l2"]])] (Let (Just (22,4)-(22,51)) NonRec [(TuplePat (Just (22,9)-(22,14)) [WildPat (Just (22,9)-(22,10)),VarPat (Just (22,11)-(22,14)) "res"],App (Just (22,18)-(22,44)) (Var (Just (22,18)-(22,32)) "List.fold_left") [Var (Just (22,33)-(22,34)) "f",Var (Just (22,35)-(22,39)) "base",Var (Just (22,40)-(22,44)) "args"])] (Var (Just (22,48)-(22,51)) "res"))
App (Just (21,15)-(21,44)) (Var (Just (21,15)-(21,23)) "List.rev") [App (Just (21,24)-(21,44)) (Var (Just (21,25)-(21,37)) "List.combine") [Var (Just (21,38)-(21,40)) "l1",Var (Just (21,41)-(21,43)) "l2"]]
Var (Just (21,15)-(21,23)) "List.rev"
App (Just (21,24)-(21,44)) (Var (Just (21,25)-(21,37)) "List.combine") [Var (Just (21,38)-(21,40)) "l1",Var (Just (21,41)-(21,43)) "l2"]
Var (Just (21,25)-(21,37)) "List.combine"
Var (Just (21,38)-(21,40)) "l1"
Var (Just (21,41)-(21,43)) "l2"
Let (Just (22,4)-(22,51)) NonRec [(TuplePat (Just (22,9)-(22,14)) [WildPat (Just (22,9)-(22,10)),VarPat (Just (22,11)-(22,14)) "res"],App (Just (22,18)-(22,44)) (Var (Just (22,18)-(22,32)) "List.fold_left") [Var (Just (22,33)-(22,34)) "f",Var (Just (22,35)-(22,39)) "base",Var (Just (22,40)-(22,44)) "args"])] (Var (Just (22,48)-(22,51)) "res")
App (Just (22,18)-(22,44)) (Var (Just (22,18)-(22,32)) "List.fold_left") [Var (Just (22,33)-(22,34)) "f",Var (Just (22,35)-(22,39)) "base",Var (Just (22,40)-(22,44)) "args"]
Var (Just (22,18)-(22,32)) "List.fold_left"
Var (Just (22,33)-(22,34)) "f"
Var (Just (22,35)-(22,39)) "base"
Var (Just (22,40)-(22,44)) "args"
Var (Just (22,48)-(22,51)) "res"
*)

(* typed spans
(16,6)-(19,55)
(20,4)-(22,51)
(20,19)-(20,21)
(21,4)-(22,51)
(21,15)-(21,44)
(21,15)-(21,23)
(21,24)-(21,44)
(21,25)-(21,37)
(21,38)-(21,40)
(21,41)-(21,43)
(22,4)-(22,51)
(22,18)-(22,44)
(22,18)-(22,32)
(22,33)-(22,34)
(22,35)-(22,39)
(22,40)-(22,44)
(22,48)-(22,51)
*)

(* correct types
(int * int list)
int list
int list
int list
(int * int) list
(int * int) list -> (int * int) list
(int * int) list
int list -> int list -> (int * int) list
int list
int list
int list
(int * int list)
((int * int list) -> (int * int) -> (int * int list)) -> (int * int list) -> (int * int) list -> (int * int list)
(int * int list) -> (int * int) -> (int * int list)
(int * int list)
(int * int) list
int list
*)

(* bad types
(int * int) list
(int * int)
int list
int list
int list
int list
int list
int list
int list
int list
int list
int list
int list
int list
int list
int list
int list
*)
