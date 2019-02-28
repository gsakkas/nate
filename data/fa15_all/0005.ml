
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  let absNumZeros = abs numZeros in
  if numZeros = 0
  then (l1, l2)
  else
    (let listZeros = clone 0 absNumZeros in
     if numZeros > 0 then (l1, (listZeros @ l2)) else ((listZeros @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | h::t -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (_,currentCarry::currentSum) = a in
      let (toSum1,toSum2) = x in
      let intermediateValue = (toSum1 + toSum2) + currentCarry in
      let valueToAddToArray = intermediateValue mod 10 in
      let carry = intermediateValue / 10 in
      (carry, (carry :: valueToAddToArray :: currentSum)) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i <= 0 then [] else bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let (padCount,currList) = a in
    let intermediateSum = mulByDigit x l2 in
    let toSum = intermediateSum * (10 ** padCount) in
    ((padCount - 1), (bigAdd currList toSum)) in
  let base = (0, []) in
  let args = l1 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  let absNumZeros = abs numZeros in
  if numZeros = 0
  then (l1, l2)
  else
    (let listZeros = clone 0 absNumZeros in
     if numZeros > 0 then (l1, (listZeros @ l2)) else ((listZeros @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | h::t -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (_,currentCarry::currentSum) = a in
      let (toSum1,toSum2) = x in
      let intermediateValue = (toSum1 + toSum2) + currentCarry in
      let valueToAddToArray = intermediateValue mod 10 in
      let carry = intermediateValue / 10 in
      (carry, (carry :: valueToAddToArray :: currentSum)) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i <= 0 then [] else bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let (padCount,currList) = a in
    let intermediateSum = mulByDigit x l2 in
    let rec generatePadding numZeros =
      if numZeros <= 0 then [] else 0 :: (generatePadding (numZeros - 1)) in
    let toSum = intermediateSum @ (generatePadding padCount) in
    ((padCount + 1), (bigAdd currList toSum)) in
  let base = (0, []) in
  let args = l1 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(37,4)-(38,45)
let rec generatePadding =
  fun numZeros ->
    if numZeros <= 0
    then []
    else 0 :: (generatePadding (numZeros - 1)) in
let toSum =
  intermediateSum @ generatePadding padCount in
(padCount + 1 , bigAdd currList
                       toSum)
LetG Rec (fromList [LamG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Let (Just (37,4)-(40,45)) Rec [(VarPat (Just (37,12)-(37,27)) "generatePadding",Lam (Just (37,28)-(38,73)) (VarPat (Just (37,28)-(37,36)) "numZeros") (Ite (Just (38,6)-(38,73)) (Bop (Just (38,9)-(38,22)) Le (Var (Just (38,9)-(38,17)) "numZeros") (Lit (Just (38,21)-(38,22)) (LI 0))) (List (Just (38,28)-(38,30)) [] Nothing) (ConApp (Just (38,36)-(38,73)) "::" (Just (Tuple (Just (38,36)-(38,73)) [Lit (Just (38,36)-(38,37)) (LI 0),App (Just (38,41)-(38,73)) (Var (Just (38,42)-(38,57)) "generatePadding") [Bop (Just (38,58)-(38,72)) Minus (Var (Just (38,59)-(38,67)) "numZeros") (Lit (Just (38,70)-(38,71)) (LI 1))]])) Nothing)) Nothing)] (Let (Just (39,4)-(40,45)) NonRec [(VarPat (Just (39,8)-(39,13)) "toSum",App (Just (39,16)-(39,60)) (Var (Just (39,32)-(39,33)) "@") [Var (Just (39,16)-(39,31)) "intermediateSum",App (Just (39,34)-(39,60)) (Var (Just (39,35)-(39,50)) "generatePadding") [Var (Just (39,51)-(39,59)) "padCount"]])] (Tuple (Just (40,4)-(40,45)) [Bop (Just (40,5)-(40,19)) Plus (Var (Just (40,6)-(40,14)) "padCount") (Lit (Just (40,17)-(40,18)) (LI 1)),App (Just (40,21)-(40,44)) (Var (Just (40,22)-(40,28)) "bigAdd") [Var (Just (40,29)-(40,37)) "currList",Var (Just (40,38)-(40,43)) "toSum"]]))
*)

(* typed spans
(37,4)-(40,45)
*)

(* correct types
(int * int list)
*)

(* bad types
(int * int list)
*)
