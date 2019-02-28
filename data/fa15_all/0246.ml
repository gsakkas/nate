
let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let rec clone x n = if n < 1 then [] else cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then (((clone 0 ((-1) * diff)) @ l1), l2)
  else if diff > 0 then (l1, ((clone 0 diff) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | hd::tl -> if hd = 0 then removeZero tl else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = padZero l1 l2 in
    let base = List.combine l1 l2 in
    let args = failwith "to be implemented" in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let rec clone x n = if n < 1 then [] else cloneHelper x n [];;

let addition (x,y) = x + y;;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then (((clone 0 ((-1) * diff)) @ l1), l2)
  else if diff > 0 then (l1, ((clone 0 diff) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | hd::tl -> if hd = 0 then removeZero tl else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (m,n) = x in
      let (y,z) = a in (((addition (m, n)) / 10), [(addition (m, n)) mod 10]) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(7,12)-(11,65)
fun (x , y) -> x + y
LamG (BopG EmptyG EmptyG)

(18,16)-(18,29)
let (m , n) = x in
let (y , z) = a in
(addition (m , n) / 10 , [addition (m , n) mod 10])
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(19,15)-(19,33)
(0 , [0])
TupleG (fromList [LitG,ListG EmptyG])

(19,15)-(19,33)
let args =
  List.rev (List.combine l1
                         l2) in
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(20,4)-(21,51)
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) VarG

(20,4)-(21,51)
List.fold_left f base args
AppG (fromList [VarG])

(20,4)-(21,51)
List.fold_left
VarG

(20,4)-(21,51)
f
VarG

(20,4)-(21,51)
base
VarG

(20,4)-(21,51)
args
VarG

(20,4)-(21,51)
res
VarG

*)

(* changed exprs
Lam (Just (7,14)-(7,26)) (TuplePat (Just (7,14)-(7,17)) [VarPat (Just (7,14)-(7,15)) "x",VarPat (Just (7,16)-(7,17)) "y"]) (Bop (Just (7,21)-(7,26)) Plus (Var (Just (7,21)-(7,22)) "x") (Var (Just (7,25)-(7,26)) "y")) Nothing
Let (Just (21,6)-(22,77)) NonRec [(TuplePat (Just (21,11)-(21,14)) [VarPat (Just (21,11)-(21,12)) "m",VarPat (Just (21,13)-(21,14)) "n"],Var (Just (21,18)-(21,19)) "x")] (Let (Just (22,6)-(22,77)) NonRec [(TuplePat (Just (22,11)-(22,14)) [VarPat (Just (22,11)-(22,12)) "y",VarPat (Just (22,13)-(22,14)) "z"],Var (Just (22,18)-(22,19)) "a")] (Tuple (Just (22,23)-(22,77)) [Bop (Just (22,24)-(22,48)) Div (App (Just (22,25)-(22,42)) (Var (Just (22,26)-(22,34)) "addition") [Tuple (Just (22,35)-(22,41)) [Var (Just (22,36)-(22,37)) "m",Var (Just (22,39)-(22,40)) "n"]]) (Lit (Just (22,45)-(22,47)) (LI 10)),List (Just (22,50)-(22,76)) [Bop (Just (22,51)-(22,75)) Mod (App (Just (22,51)-(22,68)) (Var (Just (22,52)-(22,60)) "addition") [Tuple (Just (22,61)-(22,67)) [Var (Just (22,62)-(22,63)) "m",Var (Just (22,65)-(22,66)) "n"]]) (Lit (Just (22,73)-(22,75)) (LI 10))] Nothing]))
Tuple (Just (23,15)-(23,23)) [Lit (Just (23,16)-(23,17)) (LI 0),List (Just (23,19)-(23,22)) [Lit (Just (23,20)-(23,21)) (LI 0)] Nothing]
Let (Just (24,4)-(25,51)) NonRec [(VarPat (Just (24,8)-(24,12)) "args",App (Just (24,15)-(24,44)) (Var (Just (24,15)-(24,23)) "List.rev") [App (Just (24,24)-(24,44)) (Var (Just (24,25)-(24,37)) "List.combine") [Var (Just (24,38)-(24,40)) "l1",Var (Just (24,41)-(24,43)) "l2"]])] (Let (Just (25,4)-(25,51)) NonRec [(TuplePat (Just (25,9)-(25,14)) [WildPat (Just (25,9)-(25,10)),VarPat (Just (25,11)-(25,14)) "res"],App (Just (25,18)-(25,44)) (Var (Just (25,18)-(25,32)) "List.fold_left") [Var (Just (25,33)-(25,34)) "f",Var (Just (25,35)-(25,39)) "base",Var (Just (25,40)-(25,44)) "args"])] (Var (Just (25,48)-(25,51)) "res"))
Let (Just (25,4)-(25,51)) NonRec [(TuplePat (Just (25,9)-(25,14)) [WildPat (Just (25,9)-(25,10)),VarPat (Just (25,11)-(25,14)) "res"],App (Just (25,18)-(25,44)) (Var (Just (25,18)-(25,32)) "List.fold_left") [Var (Just (25,33)-(25,34)) "f",Var (Just (25,35)-(25,39)) "base",Var (Just (25,40)-(25,44)) "args"])] (Var (Just (25,48)-(25,51)) "res")
App (Just (25,18)-(25,44)) (Var (Just (25,18)-(25,32)) "List.fold_left") [Var (Just (25,33)-(25,34)) "f",Var (Just (25,35)-(25,39)) "base",Var (Just (25,40)-(25,44)) "args"]
Var (Just (25,18)-(25,32)) "List.fold_left"
Var (Just (25,33)-(25,34)) "f"
Var (Just (25,35)-(25,39)) "base"
Var (Just (25,40)-(25,44)) "args"
Var (Just (25,48)-(25,51)) "res"
*)

(* typed spans
(7,14)-(7,26)
(21,6)-(22,77)
(23,15)-(23,23)
(24,4)-(25,51)
(25,4)-(25,51)
(25,18)-(25,44)
(25,18)-(25,32)
(25,33)-(25,34)
(25,35)-(25,39)
(25,40)-(25,44)
(25,48)-(25,51)
*)

(* correct types
(int * int) -> int
(int * int list)
(int * int list)
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
int list -> int list -> (int list * int list)
(int list * int list)
(int * int) list
(int * int) list
int list
int list
int list
int list
int list
int list
int list
*)
