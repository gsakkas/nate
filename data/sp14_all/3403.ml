
let rec clone x n =
  if n < 1
  then []
  else
    (let rec helper acc f x =
       match x with | 0 -> acc | _ -> helper (f :: acc) f (x - 1) in
     helper [] x n);;

let padZero l1 l2 =
  let x = (List.length l1) - (List.length l2) in
  if x != 0
  then
    (if x < 0
     then (((clone 0 (abs x)) @ l1), l2)
     else (l1, ((clone 0 (abs x)) @ l2)))
  else (l1, l2);;

let rec removeZero l =
  match l with | x::xs -> if x = 0 then removeZero xs else l | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (b,c) ->
          let sum = b + c in
          if sum < 10
          then
            (match a with
             | [] -> sum :: a
             | x'::xs' ->
                 if x' = (-1)
                 then
                   (if sum = 9 then (-1) :: 0 :: xs' else (sum + 1) :: xs')
                 else sum :: a)
          else
            (match a with
             | [] -> (-1) :: (sum mod 10) :: a
             | x'::xs' ->
                 if x' = (-1)
                 then (-1) :: (sum mod 10) :: a
                 else (-1) :: (sum mod 10) :: a) in
    let base = [] in
    let args =
      List.combine (clone (List.length l1) (List.length l1))
        (List.combine (List.rev l1) (List.rev l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  if n < 1
  then []
  else
    (let rec helper acc f x =
       match x with | 0 -> acc | _ -> helper (f :: acc) f (x - 1) in
     helper [] x n);;

let padZero l1 l2 =
  let x = (List.length l1) - (List.length l2) in
  if x != 0
  then
    (if x < 0
     then (((clone 0 (abs x)) @ l1), l2)
     else (l1, ((clone 0 (abs x)) @ l2)))
  else (l1, l2);;

let rec removeZero l =
  match l with | x::xs -> if x = 0 then removeZero xs else l | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (b,c) ->
          let sum = b + c in
          if sum < 10
          then
            (match a with
             | (len,[]) -> (len, [sum])
             | (len,x'::xs') ->
                 if x' = (-1)
                 then
                   (if sum = 9
                    then (len, ((-1) :: 0 :: xs'))
                    else (len, ((sum + 1) :: xs')))
                 else (len, (sum :: x' :: xs')))
          else
            (match a with
             | (len,[]) -> (len, [(-1); sum mod 10])
             | (len,x'::xs') ->
                 if x' = (-1)
                 then (len, ((-1) :: ((sum mod 10) + 1) :: xs'))
                 else (len, ((-1) :: (sum mod 10) :: x' :: xs'))) in
    let base = ((List.length l1), []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(30,12)-(36,31)
match a with
| (len , []) -> (len , [sum])
| (len , x' :: xs') -> if x' = (-1)
                       then if sum = 9
                            then (len , (-1) :: (0 :: xs'))
                            else (len , (sum + 1) :: xs')
                       else (len , sum :: (x' :: xs'))
CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG),(Nothing,TupleG (fromList [EmptyG]))])

(39,21)-(39,25)
match a with
| (len , []) -> (len , [(-1) ; sum mod 10])
| (len , x' :: xs') -> if x' = (-1)
                       then (len , (-1) :: (((sum mod 10) + 1) :: xs'))
                       else (len , (-1) :: ((sum mod 10) :: (x' :: xs')))
CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG),(Nothing,TupleG (fromList [EmptyG]))])

(39,29)-(39,46)
sum mod 10
BopG VarG LitG

(39,29)-(39,46)
sum
VarG

(39,29)-(39,46)
10
LitG

(41,25)-(41,29)
(len , (-1) :: (((sum mod 10) + 1) :: xs'))
TupleG (fromList [VarG,ConAppG (Just (TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG LitG) LitG])))])))])

(42,30)-(42,47)
(sum mod 10) + 1
BopG (BopG EmptyG EmptyG) LitG

(42,46)-(42,47)
1
LitG

(42,46)-(42,47)
xs'
VarG

(42,46)-(42,47)
(len , (-1) :: ((sum mod 10) :: (x' :: xs')))
TupleG (fromList [VarG,ConAppG (Just (TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [BopG VarG LitG,ConAppG (Just (TupleG (fromList [VarG])))])))])))])

(43,46)-(43,47)
x' :: xs'
ConAppG (Just (TupleG (fromList [VarG])))

(45,4)-(48,51)
(List.length l1 , [])
TupleG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

(46,56)-(46,58)
let args =
  List.combine (List.rev l1)
               (List.rev l2) in
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Case (Just (30,12)-(38,48)) (Var (Just (30,19)-(30,20)) "a") [(TuplePat (Just (31,16)-(31,22)) [VarPat (Just (31,16)-(31,19)) "len",ConPat (Just (31,20)-(31,22)) "[]" Nothing],Nothing,Tuple (Just (31,27)-(31,39)) [Var (Just (31,28)-(31,31)) "len",List (Just (31,33)-(31,38)) [Var (Just (31,34)-(31,37)) "sum"] Nothing]),(TuplePat (Just (32,16)-(32,27)) [VarPat (Just (32,16)-(32,19)) "len",ConsPat (Just (32,20)-(32,27)) (VarPat (Just (32,20)-(32,22)) "x'") (VarPat (Just (32,24)-(32,27)) "xs'")],Nothing,Ite (Just (33,17)-(38,47)) (Bop (Just (33,20)-(33,29)) Eq (Var (Just (33,20)-(33,22)) "x'") (Lit (Just (33,25)-(33,29)) (LI (-1)))) (Ite (Just (35,19)-(37,51)) (Bop (Just (35,23)-(35,30)) Eq (Var (Just (35,23)-(35,26)) "sum") (Lit (Just (35,29)-(35,30)) (LI 9))) (Tuple (Just (36,25)-(36,50)) [Var (Just (36,26)-(36,29)) "len",ConApp (Just (36,31)-(36,49)) "::" (Just (Tuple (Just (36,32)-(36,48)) [Lit (Just (36,32)-(36,36)) (LI (-1)),ConApp (Just (36,40)-(36,48)) "::" (Just (Tuple (Just (36,40)-(36,48)) [Lit (Just (36,40)-(36,41)) (LI 0),Var (Just (36,45)-(36,48)) "xs'"])) Nothing])) Nothing]) (Tuple (Just (37,25)-(37,50)) [Var (Just (37,26)-(37,29)) "len",ConApp (Just (37,31)-(37,49)) "::" (Just (Tuple (Just (37,32)-(37,48)) [Bop (Just (37,32)-(37,41)) Plus (Var (Just (37,33)-(37,36)) "sum") (Lit (Just (37,39)-(37,40)) (LI 1)),Var (Just (37,45)-(37,48)) "xs'"])) Nothing])) (Tuple (Just (38,22)-(38,47)) [Var (Just (38,23)-(38,26)) "len",ConApp (Just (38,28)-(38,46)) "::" (Just (Tuple (Just (38,29)-(38,45)) [Var (Just (38,29)-(38,32)) "sum",ConApp (Just (38,36)-(38,45)) "::" (Just (Tuple (Just (38,36)-(38,45)) [Var (Just (38,36)-(38,38)) "x'",Var (Just (38,42)-(38,45)) "xs'"])) Nothing])) Nothing]))]
Case (Just (40,12)-(45,65)) (Var (Just (40,19)-(40,20)) "a") [(TuplePat (Just (41,16)-(41,22)) [VarPat (Just (41,16)-(41,19)) "len",ConPat (Just (41,20)-(41,22)) "[]" Nothing],Nothing,Tuple (Just (41,27)-(41,52)) [Var (Just (41,28)-(41,31)) "len",List (Just (41,33)-(41,51)) [Lit (Just (41,34)-(41,38)) (LI (-1)),Bop (Just (41,40)-(41,50)) Mod (Var (Just (41,40)-(41,43)) "sum") (Lit (Just (41,48)-(41,50)) (LI 10))] Nothing]),(TuplePat (Just (42,16)-(42,27)) [VarPat (Just (42,16)-(42,19)) "len",ConsPat (Just (42,20)-(42,27)) (VarPat (Just (42,20)-(42,22)) "x'") (VarPat (Just (42,24)-(42,27)) "xs'")],Nothing,Ite (Just (43,17)-(45,64)) (Bop (Just (43,20)-(43,29)) Eq (Var (Just (43,20)-(43,22)) "x'") (Lit (Just (43,25)-(43,29)) (LI (-1)))) (Tuple (Just (44,22)-(44,64)) [Var (Just (44,23)-(44,26)) "len",ConApp (Just (44,28)-(44,63)) "::" (Just (Tuple (Just (44,29)-(44,62)) [Lit (Just (44,29)-(44,33)) (LI (-1)),ConApp (Just (44,37)-(44,62)) "::" (Just (Tuple (Just (44,37)-(44,62)) [Bop (Just (44,37)-(44,55)) Plus (Bop (Just (44,38)-(44,50)) Mod (Var (Just (44,39)-(44,42)) "sum") (Lit (Just (44,47)-(44,49)) (LI 10))) (Lit (Just (44,53)-(44,54)) (LI 1)),Var (Just (44,59)-(44,62)) "xs'"])) Nothing])) Nothing]) (Tuple (Just (45,22)-(45,64)) [Var (Just (45,23)-(45,26)) "len",ConApp (Just (45,28)-(45,63)) "::" (Just (Tuple (Just (45,29)-(45,62)) [Lit (Just (45,29)-(45,33)) (LI (-1)),ConApp (Just (45,37)-(45,62)) "::" (Just (Tuple (Just (45,37)-(45,62)) [Bop (Just (45,37)-(45,49)) Mod (Var (Just (45,38)-(45,41)) "sum") (Lit (Just (45,46)-(45,48)) (LI 10)),ConApp (Just (45,53)-(45,62)) "::" (Just (Tuple (Just (45,53)-(45,62)) [Var (Just (45,53)-(45,55)) "x'",Var (Just (45,59)-(45,62)) "xs'"])) Nothing])) Nothing])) Nothing]))]
Bop (Just (41,40)-(41,50)) Mod (Var (Just (41,40)-(41,43)) "sum") (Lit (Just (41,48)-(41,50)) (LI 10))
Var (Just (41,40)-(41,43)) "sum"
Lit (Just (41,48)-(41,50)) (LI 10)
Tuple (Just (44,22)-(44,64)) [Var (Just (44,23)-(44,26)) "len",ConApp (Just (44,28)-(44,63)) "::" (Just (Tuple (Just (44,29)-(44,62)) [Lit (Just (44,29)-(44,33)) (LI (-1)),ConApp (Just (44,37)-(44,62)) "::" (Just (Tuple (Just (44,37)-(44,62)) [Bop (Just (44,37)-(44,55)) Plus (Bop (Just (44,38)-(44,50)) Mod (Var (Just (44,39)-(44,42)) "sum") (Lit (Just (44,47)-(44,49)) (LI 10))) (Lit (Just (44,53)-(44,54)) (LI 1)),Var (Just (44,59)-(44,62)) "xs'"])) Nothing])) Nothing]
Bop (Just (44,37)-(44,55)) Plus (Bop (Just (44,38)-(44,50)) Mod (Var (Just (44,39)-(44,42)) "sum") (Lit (Just (44,47)-(44,49)) (LI 10))) (Lit (Just (44,53)-(44,54)) (LI 1))
Lit (Just (44,53)-(44,54)) (LI 1)
Var (Just (44,59)-(44,62)) "xs'"
Tuple (Just (45,22)-(45,64)) [Var (Just (45,23)-(45,26)) "len",ConApp (Just (45,28)-(45,63)) "::" (Just (Tuple (Just (45,29)-(45,62)) [Lit (Just (45,29)-(45,33)) (LI (-1)),ConApp (Just (45,37)-(45,62)) "::" (Just (Tuple (Just (45,37)-(45,62)) [Bop (Just (45,37)-(45,49)) Mod (Var (Just (45,38)-(45,41)) "sum") (Lit (Just (45,46)-(45,48)) (LI 10)),ConApp (Just (45,53)-(45,62)) "::" (Just (Tuple (Just (45,53)-(45,62)) [Var (Just (45,53)-(45,55)) "x'",Var (Just (45,59)-(45,62)) "xs'"])) Nothing])) Nothing])) Nothing]
ConApp (Just (45,53)-(45,62)) "::" (Just (Tuple (Just (45,53)-(45,62)) [Var (Just (45,53)-(45,55)) "x'",Var (Just (45,59)-(45,62)) "xs'"])) Nothing
Tuple (Just (46,15)-(46,37)) [App (Just (46,16)-(46,32)) (Var (Just (46,17)-(46,28)) "List.length") [Var (Just (46,29)-(46,31)) "l1"],List (Just (46,34)-(46,36)) [] Nothing]
Let (Just (47,4)-(48,51)) NonRec [(VarPat (Just (47,8)-(47,12)) "args",App (Just (47,15)-(47,55)) (Var (Just (47,15)-(47,27)) "List.combine") [App (Just (47,28)-(47,41)) (Var (Just (47,29)-(47,37)) "List.rev") [Var (Just (47,38)-(47,40)) "l1"],App (Just (47,42)-(47,55)) (Var (Just (47,43)-(47,51)) "List.rev") [Var (Just (47,52)-(47,54)) "l2"]])] (Let (Just (48,4)-(48,51)) NonRec [(TuplePat (Just (48,9)-(48,14)) [WildPat (Just (48,9)-(48,10)),VarPat (Just (48,11)-(48,14)) "res"],App (Just (48,18)-(48,44)) (Var (Just (48,18)-(48,32)) "List.fold_left") [Var (Just (48,33)-(48,34)) "f",Var (Just (48,35)-(48,39)) "base",Var (Just (48,40)-(48,44)) "args"])] (Var (Just (48,48)-(48,51)) "res"))
*)

(* typed spans
(30,12)-(38,48)
(40,12)-(45,65)
(41,40)-(41,50)
(41,40)-(41,43)
(41,48)-(41,50)
(44,22)-(44,64)
(44,37)-(44,55)
(44,53)-(44,54)
(44,59)-(44,62)
(45,22)-(45,64)
(45,53)-(45,62)
(46,15)-(46,37)
(47,4)-(48,51)
*)

(* correct types
(int * int list)
(int * int list)
int
int
int
(int * int list)
int
int
int list
(int * int list)
int list
(int * int list)
int list
*)

(* bad types
int list
int
int list
int list
int list
int
int list
int list
int list
int list
int list
int list
int list
*)
