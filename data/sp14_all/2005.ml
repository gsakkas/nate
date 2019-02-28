
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let shorter = if len1 < len2 then l1 else l2 in
  let zeros = if shorter = l1 then len2 - len1 else len1 - len2 in
  if shorter = l1
  then ((List.append (clone 0 zeros) shorter), l2)
  else (l1, (List.append (clone 0 zeros) shorter));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let getTail l = match l with | [] -> [] | h::t -> t in
      let getCarry (c,l) = c in
      let carry = getCarry a in
      let getSum (c,l) = l in
      let sum = if carry = 1 then getTail (getSum a) else getSum a in
      let add (m,n) = m + n in
      let digit = (add x) + carry in
      if digit > 9
      then (1, (1 :: (digit - 10) :: sum))
      else (0, (digit :: sum)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l = if i > 0 then bigAdd (mulByDigit (i - 1) l);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let shorter = if len1 < len2 then l1 else l2 in
  let zeros = if shorter = l1 then len2 - len1 else len1 - len2 in
  if shorter = l1
  then ((List.append (clone 0 zeros) shorter), l2)
  else (l1, (List.append (clone 0 zeros) shorter));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let getTail l = match l with | [] -> [] | h::t -> t in
      let getCarry (c,l) = c in
      let carry = getCarry a in
      let getSum (c,l) = l in
      let sum = if carry = 1 then getTail (getSum a) else getSum a in
      let add (m,n) = m + n in
      let digit = (add x) + carry in
      if digit > 9
      then (1, (1 :: (digit - 10) :: sum))
      else (0, (digit :: sum)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0 then [0] else bigAdd (mulByDigit (i - 1) l) [0];;

*)

(* changed spans
(34,28)-(34,33)
i = 0
BopG VarG LitG

(34,39)-(34,68)
[0]
ListG LitG

(34,39)-(34,45)
bigAdd (mulByDigit (i - 1) l)
       [0]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

(34,25)-(34,68)
[0]
ListG LitG

*)

(* changed exprs
Bop (Just (35,5)-(35,10)) Eq (Var (Just (35,5)-(35,6)) "i") (Lit (Just (35,9)-(35,10)) (LI 0))
List (Just (35,16)-(35,19)) [Lit (Just (35,17)-(35,18)) (LI 0)] Nothing
App (Just (35,25)-(35,58)) (Var (Just (35,25)-(35,31)) "bigAdd") [App (Just (35,32)-(35,54)) (Var (Just (35,33)-(35,43)) "mulByDigit") [Bop (Just (35,44)-(35,51)) Minus (Var (Just (35,45)-(35,46)) "i") (Lit (Just (35,49)-(35,50)) (LI 1)),Var (Just (35,52)-(35,53)) "l"],List (Just (35,55)-(35,58)) [Lit (Just (35,56)-(35,57)) (LI 0)] Nothing]
List (Just (35,55)-(35,58)) [Lit (Just (35,56)-(35,57)) (LI 0)] Nothing
*)

(* typed spans
(35,5)-(35,10)
(35,16)-(35,19)
(35,25)-(35,58)
(35,55)-(35,58)
*)

(* correct types
bool
int list
int list
int list
*)

(* bad types
bool
int list -> int list
int list -> int list -> int list
unit
*)
