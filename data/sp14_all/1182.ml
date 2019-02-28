
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let length1 = List.fold_left (fun acc  -> fun x  -> acc + 1) 0 l1 in
  let length2 = List.fold_left (fun acc  -> fun x  -> acc + 1) 0 l2 in
  if length1 < length2
  then clone 0 (length2 - length1)
  else if length2 < length1 then clone 0 (length1 - length2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let length1 = List.fold_left (fun acc  -> fun x  -> acc + 1) 0 l1 in
  let length2 = List.fold_left (fun acc  -> fun x  -> acc + 1) 0 l2 in
  if length1 = length2
  then (l1, l2)
  else
    if length1 < length2
    then ((List.append (clone 0 (length2 - length1)) l1), l2)
    else (l1, (List.append (clone 0 (length1 - length2)) l2));;

*)

(* changed spans
(7,5)-(7,22)
length1 = length2
BopG VarG VarG

(7,5)-(7,22)
(l1 , l2)
TupleG (fromList [VarG])

(7,5)-(7,22)
if length1 < length2
then (List.append (clone 0
                         (length2 - length1)) l1 , l2)
else (l1 , List.append (clone 0
                              (length1 - length2)) l2)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(8,7)-(8,34)
(List.append (clone 0
                    (length2 - length1)) l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(8,7)-(8,12)
List.append
VarG

(8,7)-(8,12)
clone 0 (length2 - length1)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(9,7)-(9,60)
l1
VarG

(9,33)-(9,60)
l2
VarG

(9,33)-(9,60)
(l1 , List.append (clone 0
                         (length1 - length2)) l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(9,33)-(9,38)
List.append
VarG

(9,33)-(9,38)
clone 0 (length1 - length2)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(9,7)-(9,60)
l2
VarG

*)

(* changed exprs
Bop (Just (7,5)-(7,22)) Eq (Var (Just (7,5)-(7,12)) "length1") (Var (Just (7,15)-(7,22)) "length2")
Tuple (Just (8,7)-(8,15)) [Var (Just (8,8)-(8,10)) "l1",Var (Just (8,12)-(8,14)) "l2"]
Ite (Just (10,4)-(12,61)) (Bop (Just (10,7)-(10,24)) Lt (Var (Just (10,7)-(10,14)) "length1") (Var (Just (10,17)-(10,24)) "length2")) (Tuple (Just (11,9)-(11,61)) [App (Just (11,10)-(11,56)) (Var (Just (11,11)-(11,22)) "List.append") [App (Just (11,23)-(11,52)) (Var (Just (11,24)-(11,29)) "clone") [Lit (Just (11,30)-(11,31)) (LI 0),Bop (Just (11,32)-(11,51)) Minus (Var (Just (11,33)-(11,40)) "length2") (Var (Just (11,43)-(11,50)) "length1")],Var (Just (11,53)-(11,55)) "l1"],Var (Just (11,58)-(11,60)) "l2"]) (Tuple (Just (12,9)-(12,61)) [Var (Just (12,10)-(12,12)) "l1",App (Just (12,14)-(12,60)) (Var (Just (12,15)-(12,26)) "List.append") [App (Just (12,27)-(12,56)) (Var (Just (12,28)-(12,33)) "clone") [Lit (Just (12,34)-(12,35)) (LI 0),Bop (Just (12,36)-(12,55)) Minus (Var (Just (12,37)-(12,44)) "length1") (Var (Just (12,47)-(12,54)) "length2")],Var (Just (12,57)-(12,59)) "l2"]])
Tuple (Just (11,9)-(11,61)) [App (Just (11,10)-(11,56)) (Var (Just (11,11)-(11,22)) "List.append") [App (Just (11,23)-(11,52)) (Var (Just (11,24)-(11,29)) "clone") [Lit (Just (11,30)-(11,31)) (LI 0),Bop (Just (11,32)-(11,51)) Minus (Var (Just (11,33)-(11,40)) "length2") (Var (Just (11,43)-(11,50)) "length1")],Var (Just (11,53)-(11,55)) "l1"],Var (Just (11,58)-(11,60)) "l2"]
Var (Just (11,11)-(11,22)) "List.append"
App (Just (11,23)-(11,52)) (Var (Just (11,24)-(11,29)) "clone") [Lit (Just (11,30)-(11,31)) (LI 0),Bop (Just (11,32)-(11,51)) Minus (Var (Just (11,33)-(11,40)) "length2") (Var (Just (11,43)-(11,50)) "length1")]
Var (Just (11,53)-(11,55)) "l1"
Var (Just (11,58)-(11,60)) "l2"
Tuple (Just (12,9)-(12,61)) [Var (Just (12,10)-(12,12)) "l1",App (Just (12,14)-(12,60)) (Var (Just (12,15)-(12,26)) "List.append") [App (Just (12,27)-(12,56)) (Var (Just (12,28)-(12,33)) "clone") [Lit (Just (12,34)-(12,35)) (LI 0),Bop (Just (12,36)-(12,55)) Minus (Var (Just (12,37)-(12,44)) "length1") (Var (Just (12,47)-(12,54)) "length2")],Var (Just (12,57)-(12,59)) "l2"]]
Var (Just (12,15)-(12,26)) "List.append"
App (Just (12,27)-(12,56)) (Var (Just (12,28)-(12,33)) "clone") [Lit (Just (12,34)-(12,35)) (LI 0),Bop (Just (12,36)-(12,55)) Minus (Var (Just (12,37)-(12,44)) "length1") (Var (Just (12,47)-(12,54)) "length2")]
Var (Just (12,57)-(12,59)) "l2"
*)

(* typed spans
(7,5)-(7,22)
(8,7)-(8,15)
(10,4)-(12,61)
(11,9)-(11,61)
(11,11)-(11,22)
(11,23)-(11,52)
(11,53)-(11,55)
(11,58)-(11,60)
(12,9)-(12,61)
(12,15)-(12,26)
(12,27)-(12,56)
(12,57)-(12,59)
*)

(* correct types
bool
(int list * int list)
(int list * int list)
(int list * int list)
int list -> int list -> int list
int list
int list
int list
(int list * int list)
int list -> int list -> int list
int list
int list
*)

(* bad types
bool
bool
bool
int list
int -> int -> int list
int -> int -> int list
unit
int list
int list
int -> int -> int list
int -> int -> int list
unit
*)
