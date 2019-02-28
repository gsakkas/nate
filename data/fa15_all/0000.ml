
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
    let f a x = failwith "to be implemented" in
    let base = 0 in
    let args = failwith "to be implemented" in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


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
      let (carry,currentSum) = a in
      let (toSum1,toSum2) = x in
      let intermediateValue = (toSum1 + toSum2) + carry in
      let valueToAddToArray = intermediateValue mod 10 in
      let carry = intermediateValue / 10 in
      (carry, (valueToAddToArray :: currentSum)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,16)-(18,44)
let (carry , currentSum) =
  a in
let (toSum1 , toSum2) = x in
let intermediateValue =
  (toSum1 + toSum2) + carry in
let valueToAddToArray =
  intermediateValue mod 10 in
let carry =
  intermediateValue / 10 in
(carry , valueToAddToArray :: currentSum)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(19,15)-(19,16)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG])

(20,4)-(21,51)
[]
ListG EmptyG

(20,24)-(20,43)
List.rev
VarG

(21,4)-(21,51)
List.combine l1 l2
AppG (fromList [VarG])

*)

(* changed exprs
Let (Just (19,6)-(24,48)) NonRec [(TuplePat (Just (19,11)-(19,27)) [VarPat (Just (19,11)-(19,16)) "carry",VarPat (Just (19,17)-(19,27)) "currentSum"],Var (Just (19,31)-(19,32)) "a")] (Let (Just (20,6)-(24,48)) NonRec [(TuplePat (Just (20,11)-(20,24)) [VarPat (Just (20,11)-(20,17)) "toSum1",VarPat (Just (20,18)-(20,24)) "toSum2"],Var (Just (20,28)-(20,29)) "x")] (Let (Just (21,6)-(24,48)) NonRec [(VarPat (Just (21,10)-(21,27)) "intermediateValue",Bop (Just (21,30)-(21,55)) Plus (Bop (Just (21,30)-(21,47)) Plus (Var (Just (21,31)-(21,37)) "toSum1") (Var (Just (21,40)-(21,46)) "toSum2")) (Var (Just (21,50)-(21,55)) "carry"))] (Let (Just (22,6)-(24,48)) NonRec [(VarPat (Just (22,10)-(22,27)) "valueToAddToArray",Bop (Just (22,30)-(22,54)) Mod (Var (Just (22,30)-(22,47)) "intermediateValue") (Lit (Just (22,52)-(22,54)) (LI 10)))] (Let (Just (23,6)-(24,48)) NonRec [(VarPat (Just (23,10)-(23,15)) "carry",Bop (Just (23,18)-(23,40)) Div (Var (Just (23,18)-(23,35)) "intermediateValue") (Lit (Just (23,38)-(23,40)) (LI 10)))] (Tuple (Just (24,6)-(24,48)) [Var (Just (24,7)-(24,12)) "carry",ConApp (Just (24,14)-(24,47)) "::" (Just (Tuple (Just (24,15)-(24,46)) [Var (Just (24,15)-(24,32)) "valueToAddToArray",Var (Just (24,36)-(24,46)) "currentSum"])) Nothing])))))
Tuple (Just (25,15)-(25,22)) [Lit (Just (25,16)-(25,17)) (LI 0),List (Just (25,19)-(25,21)) [] Nothing]
List (Just (25,19)-(25,21)) [] Nothing
Var (Just (26,15)-(26,23)) "List.rev"
App (Just (26,24)-(26,44)) (Var (Just (26,25)-(26,37)) "List.combine") [Var (Just (26,38)-(26,40)) "l1",Var (Just (26,41)-(26,43)) "l2"]
*)

(* typed spans
(19,6)-(24,48)
(25,15)-(25,22)
(25,19)-(25,21)
(26,15)-(26,23)
(26,24)-(26,44)
*)

(* correct types
(int * int list)
(int * int list)
int list
(int * int) list -> (int * int) list
(int * int) list
*)

(* bad types
int
int
int list
string
int list
*)
