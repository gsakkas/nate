
let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x',x'') = x in
      let (c,s) = a in
      if (List.length s) = ((List.length l1) - 1)
      then (c, ((((c + x') + x'') / 10) :: (((c + x') + x'') mod 10) :: s))
      else ((((c + x') + x'') / 10), ((((c + x') + x'') mod 10) :: s)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i > 0 then bigAdd l (mulByDigit (i - 1) l) else [0];;

let bigMul l1 l2 =
  let f a x =
    let (i,l) = x in
    let (i',l') = a in
    match i' with | [] -> l' | h::t -> bigAdd ((mulByDigit h l') l') in
  let base = (1, l1) in
  let args = ((List.rev l2), l1) in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x',x'') = x in
      let (c,s) = a in
      if (List.length s) = ((List.length l1) - 1)
      then (c, ((((c + x') + x'') / 10) :: (((c + x') + x'') mod 10) :: s))
      else ((((c + x') + x'') / 10), ((((c + x') + x'') mod 10) :: s)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i > 0 then bigAdd l (mulByDigit (i - 1) l) else [0];;

let bigMul l1 l2 =
  let f a x =
    match a with | (l1',a') -> (l1', (bigAdd (mulByDigit x l1') a')) in
  let base = (l1, []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(31,4)-(33,68)
match a with
| (l1' , a') -> (l1' , bigAdd (mulByDigit x
                                          l1') a')
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(34,2)-(36,49)
[]
ListG EmptyG

(35,13)-(35,32)
l1
VarG

(35,13)-(35,32)
[]
ListG EmptyG

(35,13)-(35,32)
let args = List.rev l2 in
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Case (Just (31,4)-(31,68)) (Var (Just (31,10)-(31,11)) "a") [(TuplePat (Just (31,20)-(31,26)) [VarPat (Just (31,20)-(31,23)) "l1'",VarPat (Just (31,24)-(31,26)) "a'"],Nothing,Tuple (Just (31,31)-(31,68)) [Var (Just (31,32)-(31,35)) "l1'",App (Just (31,37)-(31,67)) (Var (Just (31,38)-(31,44)) "bigAdd") [App (Just (31,45)-(31,63)) (Var (Just (31,46)-(31,56)) "mulByDigit") [Var (Just (31,57)-(31,58)) "x",Var (Just (31,59)-(31,62)) "l1'"],Var (Just (31,64)-(31,66)) "a'"]])]
List (Just (32,18)-(32,20)) [] Nothing
Var (Just (32,14)-(32,16)) "l1"
List (Just (32,18)-(32,20)) [] Nothing
Let (Just (33,2)-(33,75)) NonRec [(VarPat (Just (33,6)-(33,10)) "args",App (Just (33,13)-(33,24)) (Var (Just (33,13)-(33,21)) "List.rev") [Var (Just (33,22)-(33,24)) "l2"])] (Let (Just (33,28)-(33,75)) NonRec [(TuplePat (Just (33,33)-(33,38)) [WildPat (Just (33,33)-(33,34)),VarPat (Just (33,35)-(33,38)) "res"],App (Just (33,42)-(33,68)) (Var (Just (33,42)-(33,56)) "List.fold_left") [Var (Just (33,57)-(33,58)) "f",Var (Just (33,59)-(33,63)) "base",Var (Just (33,64)-(33,68)) "args"])] (Var (Just (33,72)-(33,75)) "res"))
*)

(* typed spans
(31,4)-(31,68)
(32,18)-(32,20)
(32,14)-(32,16)
(32,18)-(32,20)
(33,2)-(33,75)
*)

(* correct types
(int list * int list)
int list
int list
int list
int list
*)

(* bad types
int list
'a
('a list * 'b)
('a list * 'b)
('a list * 'b)
*)
