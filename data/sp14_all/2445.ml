
let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then
    let l1G = (List.length l1) - (List.length l2) in
    List.append (l1, ((clone 0 l1G) l2))
  else
    if (List.length l1) < (List.length l2)
    then
      (let l2G = (List.length l2) - (List.length l1) in
       List.append (((clone 0 l2G) l1), l2))
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
(8,4)-(8,40)
(l1 , List.append (clone 0
                         l1G) l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(13,7)-(13,43)
(List.append (clone 0 l2G)
             l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(13,7)-(13,43)
List.append (clone 0 l2G) l1
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(13,7)-(13,43)
List.append
VarG

(13,22)-(13,27)
clone 0 l2G
AppG (fromList [VarG,LitG])

*)

(* changed exprs
Tuple (Just (8,4)-(8,40)) [Var (Just (8,5)-(8,7)) "l1",App (Just (8,9)-(8,39)) (Var (Just (8,10)-(8,21)) "List.append") [App (Just (8,22)-(8,35)) (Var (Just (8,23)-(8,28)) "clone") [Lit (Just (8,29)-(8,30)) (LI 0),Var (Just (8,31)-(8,34)) "l1G"],Var (Just (8,36)-(8,38)) "l2"]]
Tuple (Just (13,7)-(13,43)) [App (Just (13,8)-(13,38)) (Var (Just (13,9)-(13,20)) "List.append") [App (Just (13,21)-(13,34)) (Var (Just (13,22)-(13,27)) "clone") [Lit (Just (13,28)-(13,29)) (LI 0),Var (Just (13,30)-(13,33)) "l2G"],Var (Just (13,35)-(13,37)) "l1"],Var (Just (13,40)-(13,42)) "l2"]
App (Just (13,8)-(13,38)) (Var (Just (13,9)-(13,20)) "List.append") [App (Just (13,21)-(13,34)) (Var (Just (13,22)-(13,27)) "clone") [Lit (Just (13,28)-(13,29)) (LI 0),Var (Just (13,30)-(13,33)) "l2G"],Var (Just (13,35)-(13,37)) "l1"]
Var (Just (13,9)-(13,20)) "List.append"
App (Just (13,21)-(13,34)) (Var (Just (13,22)-(13,27)) "clone") [Lit (Just (13,28)-(13,29)) (LI 0),Var (Just (13,30)-(13,33)) "l2G"]
*)

(* typed spans
(8,4)-(8,40)
(13,7)-(13,43)
(13,8)-(13,38)
(13,9)-(13,20)
(13,21)-(13,34)
*)

(* correct types
(int list * int list)
(int list * int list)
int list
int list -> int list -> int list
int list
*)

(* bad types
('a list * 'b list)
('a list * 'b list)
('a list * 'b list)
('a list * 'b list)
int -> int -> int list
*)
