
let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then clone (l1, (0 :: l2))
  else
    if (List.length l1) < (List.length l2)
    then clone ((0 :: l1), l2)
    else (l1, l2);;


(* fix

let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then
    let l1G = (List.length l1) - (List.length l2) in
    (l1, (List.append (clone 0 l1G) l2))
  else
    if (List.length l1) < (List.length l2)
    then
      (let l2G = (List.length l2) - (List.length l1) in
       ((List.append (clone 0 l2G) l1), l2))
    else (l1, l2);;

*)

(* changed spans
(6,7)-(6,28)
let l1G =
  List.length l1 - List.length l2 in
(l1 , List.append (clone 0
                         l1G) l2)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (TupleG (fromList [EmptyG]))

(9,9)-(9,30)
let l2G =
  List.length l2 - List.length l1 in
(List.append (clone 0 l2G)
             l1 , l2)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (TupleG (fromList [EmptyG]))

(9,9)-(9,14)
List.length
VarG

(9,15)-(9,30)
l2
VarG

(9,15)-(9,30)
List.length l1
AppG (fromList [VarG])

(9,16)-(9,25)
List.append (clone 0 l2G) l1
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
Let (Just (7,4)-(8,40)) NonRec [(VarPat (Just (7,8)-(7,11)) "l1G",Bop (Just (7,14)-(7,49)) Minus (App (Just (7,14)-(7,30)) (Var (Just (7,15)-(7,26)) "List.length") [Var (Just (7,27)-(7,29)) "l1"]) (App (Just (7,33)-(7,49)) (Var (Just (7,34)-(7,45)) "List.length") [Var (Just (7,46)-(7,48)) "l2"]))] (Tuple (Just (8,4)-(8,40)) [Var (Just (8,5)-(8,7)) "l1",App (Just (8,9)-(8,39)) (Var (Just (8,10)-(8,21)) "List.append") [App (Just (8,22)-(8,35)) (Var (Just (8,23)-(8,28)) "clone") [Lit (Just (8,29)-(8,30)) (LI 0),Var (Just (8,31)-(8,34)) "l1G"],Var (Just (8,36)-(8,38)) "l2"]])
Let (Just (12,6)-(13,44)) NonRec [(VarPat (Just (12,11)-(12,14)) "l2G",Bop (Just (12,17)-(12,52)) Minus (App (Just (12,17)-(12,33)) (Var (Just (12,18)-(12,29)) "List.length") [Var (Just (12,30)-(12,32)) "l2"]) (App (Just (12,36)-(12,52)) (Var (Just (12,37)-(12,48)) "List.length") [Var (Just (12,49)-(12,51)) "l1"]))] (Tuple (Just (13,7)-(13,43)) [App (Just (13,8)-(13,38)) (Var (Just (13,9)-(13,20)) "List.append") [App (Just (13,21)-(13,34)) (Var (Just (13,22)-(13,27)) "clone") [Lit (Just (13,28)-(13,29)) (LI 0),Var (Just (13,30)-(13,33)) "l2G"],Var (Just (13,35)-(13,37)) "l1"],Var (Just (13,40)-(13,42)) "l2"])
Var (Just (12,18)-(12,29)) "List.length"
Var (Just (12,30)-(12,32)) "l2"
App (Just (12,36)-(12,52)) (Var (Just (12,37)-(12,48)) "List.length") [Var (Just (12,49)-(12,51)) "l1"]
App (Just (13,8)-(13,38)) (Var (Just (13,9)-(13,20)) "List.append") [App (Just (13,21)-(13,34)) (Var (Just (13,22)-(13,27)) "clone") [Lit (Just (13,28)-(13,29)) (LI 0),Var (Just (13,30)-(13,33)) "l2G"],Var (Just (13,35)-(13,37)) "l1"]
*)

(* typed spans
(7,4)-(8,40)
(12,6)-(13,44)
(12,18)-(12,29)
(12,30)-(12,32)
(12,36)-(12,52)
(13,8)-(13,38)
*)

(* correct types
(int list * int list)
(int list * int list)
int list -> int
int list
int
int list
*)

(* bad types
int -> (int list * int list) list
int -> (int list * int list) list
(int list * int list) -> int -> (int list * int list) list
(int list * int list)
(int list * int list)
int list
*)
