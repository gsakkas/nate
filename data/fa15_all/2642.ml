
let rec clone x n = if n < 1 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 < length2
  then (((clone 0 (length2 - length1)) @ l1), l2)
  else
    if length2 < length1
    then (l1, ((clone 0 (length1 - length2)) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else [h] @ t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (j,k) = x in
      let (carry,rest) = a in
      ((((j + k) + carry) / 10), ([((j + k) + carry) mod 10] @ rest)) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (car,res) = List.fold_left f base args in [car] @ res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> [] | 1 -> l | n -> bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let (pow,total) = a in
    ((pow + 1), (total + ((mulByDigit x l2) * (10 ** pow)))) in
  let base = (0, []) in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n < 1 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 < length2
  then (((clone 0 (length2 - length1)) @ l1), l2)
  else
    if length2 < length1
    then (l1, ((clone 0 (length1 - length2)) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else [h] @ t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (j,k) = x in
      let (carry,rest) = a in
      ((((j + k) + carry) / 10), ([((j + k) + carry) mod 10] @ rest)) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (car,res) = List.fold_left f base args in [car] @ res in
  removeZero (add (padZero l1 l2));;

let rec listZeros n =
  match n with | 0 -> [] | 1 -> [0] | x -> [0] @ (listZeros (n - 1));;

let rec mulByDigit i l =
  match i with | 0 -> [] | 1 -> l | n -> bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let (pow,total) = a in
    ((pow + 1), ((bigAdd total (mulByDigit x l2)) @ (listZeros pow))) in
  let base = (0, []) in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(28,19)-(29,72)
fun n ->
  match n with
  | 0 -> []
  | 1 -> [0]
  | x -> [0] @ listZeros (n - 1)
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(34,16)-(34,59)
bigAdd total (mulByDigit x
                         l2) @ listZeros pow
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Lam (Just (28,18)-(29,68)) (VarPat (Just (28,18)-(28,19)) "n") (Case (Just (29,2)-(29,68)) (Var (Just (29,8)-(29,9)) "n") [(LitPat (Just (29,17)-(29,18)) (LI 0),Nothing,List (Just (29,22)-(29,24)) [] Nothing),(LitPat (Just (29,27)-(29,28)) (LI 1),Nothing,List (Just (29,32)-(29,35)) [Lit (Just (29,33)-(29,34)) (LI 0)] Nothing),(VarPat (Just (29,38)-(29,39)) "x",Nothing,App (Just (29,43)-(29,68)) (Var (Just (29,47)-(29,48)) "@") [List (Just (29,43)-(29,46)) [Lit (Just (29,44)-(29,45)) (LI 0)] Nothing,App (Just (29,49)-(29,68)) (Var (Just (29,50)-(29,59)) "listZeros") [Bop (Just (29,60)-(29,67)) Minus (Var (Just (29,61)-(29,62)) "n") (Lit (Just (29,65)-(29,66)) (LI 1))]])]) Nothing
App (Just (37,16)-(37,68)) (Var (Just (37,50)-(37,51)) "@") [App (Just (37,17)-(37,49)) (Var (Just (37,18)-(37,24)) "bigAdd") [Var (Just (37,25)-(37,30)) "total",App (Just (37,31)-(37,48)) (Var (Just (37,32)-(37,42)) "mulByDigit") [Var (Just (37,43)-(37,44)) "x",Var (Just (37,45)-(37,47)) "l2"]],App (Just (37,52)-(37,67)) (Var (Just (37,53)-(37,62)) "listZeros") [Var (Just (37,63)-(37,66)) "pow"]]
*)

(* typed spans
(28,18)-(29,68)
(37,16)-(37,68)
*)

(* correct types
int -> int list
int list
*)

(* bad types
int -> int list -> int list
int
*)
