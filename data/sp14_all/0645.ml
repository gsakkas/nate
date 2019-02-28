
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
  let f a x = match x with | [] -> a | h::t -> bigAdd ((mulByDigit (h a)) a) in
  let base = l1 in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;


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
(30,14)-(30,76)
match a with
| (l1' , a') -> (l1' , bigAdd (mulByDigit x
                                          l1') a')
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(30,70)-(30,71)
(l1 , [])
TupleG (fromList [VarG,ListG EmptyG])

(30,74)-(30,75)
[]
ListG EmptyG

*)

(* changed exprs
Case (Just (31,4)-(31,68)) (Var (Just (31,10)-(31,11)) "a") [(TuplePat (Just (31,20)-(31,26)) [VarPat (Just (31,20)-(31,23)) "l1'",VarPat (Just (31,24)-(31,26)) "a'"],Nothing,Tuple (Just (31,31)-(31,68)) [Var (Just (31,32)-(31,35)) "l1'",App (Just (31,37)-(31,67)) (Var (Just (31,38)-(31,44)) "bigAdd") [App (Just (31,45)-(31,63)) (Var (Just (31,46)-(31,56)) "mulByDigit") [Var (Just (31,57)-(31,58)) "x",Var (Just (31,59)-(31,62)) "l1'"],Var (Just (31,64)-(31,66)) "a'"]])]
Tuple (Just (32,13)-(32,21)) [Var (Just (32,14)-(32,16)) "l1",List (Just (32,18)-(32,20)) [] Nothing]
List (Just (32,18)-(32,20)) [] Nothing
*)

(* typed spans
(31,4)-(31,68)
(32,13)-(32,21)
(32,18)-(32,20)
*)

(* correct types
(int list * int list)
(int list * int list)
int list
*)

(* bad types
int list
int list
int list
*)
