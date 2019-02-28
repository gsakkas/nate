
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n > 0 then (l1, ((clone 0 n) @ l2)) else (((clone 0 (0 - n)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,accList) = a in
      let (x1,x2) = x in
      ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: accList)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in
    if carry = 1 then 1 :: res else res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f a x =
    let (carry,accList) = a in
    (((carry + (x * i)) / 10), (((carry + (x * i)) mod 10) :: accList)) in
  let base = (0, []) in
  let newlist = List.rev (0 :: l) in
  let (_,res) = List.fold_left f base newlist in removeZero res;;

let bigMul l1 l2 =
  let f a x =
    let (bit,l) = a in
    let movedList = List.append l [0] in ((bit + 1), (bigAdd movedList x)) in
  let base = (0, []) in
  let f' a x = List.append a (mulByDigit x l1) in
  let base' = [] in
  let args = List.fold_left f' base' l2 in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n > 0 then (l1, ((clone 0 n) @ l2)) else (((clone 0 (0 - n)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,accList) = a in
      let (x1,x2) = x in
      ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: accList)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in
    if carry = 1 then 1 :: res else res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f a x =
    let (carry,accList) = a in
    (((carry + (x * i)) / 10), (((carry + (x * i)) mod 10) :: accList)) in
  let base = (0, []) in
  let newlist = List.rev (0 :: l) in
  let (_,res) = List.fold_left f base newlist in removeZero res;;

let bigMul l1 l2 =
  let f a x =
    let (ll,accumulate) = a in
    let multed = mulByDigit x l1 in
    let accumulate = List.append accumulate [0] in
    (l1, (bigAdd accumulate multed)) in
  let base = (l1, [0]) in
  let args = l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(33,4)-(34,74)
let (ll , accumulate) = a in
let multed =
  mulByDigit x l1 in
let accumulate =
  List.append accumulate [0] in
(l1 , bigAdd accumulate
             multed)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(36,2)-(39,49)
l1
VarG

(36,2)-(39,49)
[0]
ListG LitG

*)

(* changed exprs
Let (Just (33,4)-(36,36)) NonRec [(TuplePat (Just (33,9)-(33,22)) [VarPat (Just (33,9)-(33,11)) "ll",VarPat (Just (33,12)-(33,22)) "accumulate"],Var (Just (33,26)-(33,27)) "a")] (Let (Just (34,4)-(36,36)) NonRec [(VarPat (Just (34,8)-(34,14)) "multed",App (Just (34,17)-(34,32)) (Var (Just (34,17)-(34,27)) "mulByDigit") [Var (Just (34,28)-(34,29)) "x",Var (Just (34,30)-(34,32)) "l1"])] (Let (Just (35,4)-(36,36)) NonRec [(VarPat (Just (35,8)-(35,18)) "accumulate",App (Just (35,21)-(35,47)) (Var (Just (35,21)-(35,32)) "List.append") [Var (Just (35,33)-(35,43)) "accumulate",List (Just (35,44)-(35,47)) [Lit (Just (35,45)-(35,46)) (LI 0)] Nothing])] (Tuple (Just (36,4)-(36,36)) [Var (Just (36,5)-(36,7)) "l1",App (Just (36,9)-(36,35)) (Var (Just (36,10)-(36,16)) "bigAdd") [Var (Just (36,17)-(36,27)) "accumulate",Var (Just (36,28)-(36,34)) "multed"]])))
Var (Just (37,14)-(37,16)) "l1"
List (Just (37,18)-(37,21)) [Lit (Just (37,19)-(37,20)) (LI 0)] Nothing
*)

(* typed spans
(33,4)-(36,36)
(37,14)-(37,16)
(37,18)-(37,21)
*)

(* correct types
(int list * int list)
int list
int list
*)

(* bad types
(int * int list)
'a
'a
*)
