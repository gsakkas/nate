
let rec clone x n =
  let rec helper xs sub depth =
    match depth > 0 with
    | false  -> xs
    | true  -> helper (sub :: xs) sub (depth - 1) in
  helper [] x n;;

let rec padZero l1 l2 =
  let sizeDif = (List.length l1) - (List.length l2) in
  let appendS = clone 0 (abs sizeDif) in
  if sizeDif < 0 then ((appendS @ l1), l2) else (l1, (appendS @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (op1,op2) ->
          let res = op1 + op2 in
          let (p1,p2) = a in
          (match p2 with
           | [] -> (p1, [res / 10; res mod 10])
           | a::b ->
               let re = a + res in (p1, ((re / 10) :: (re mod 10) :: b))) in
    let base = ([], []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec helper i l acc =
    match i with | 0 -> acc | _ -> helper (i - 1) l (bigAdd l acc) in
  helper i l [0];;

let bigMul l1 l2 =
  let f a x =
    let (b,c) = a in
    match b with
    | d::t -> (((d * 10) :: t), (bigAdd (((mulByDigit d) * (x t)) c)))
    | _ -> a in
  let base = ((1 :: l2), [0]) in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;


(* fix

let bigMul l1 l2 =
  let f a x =
    let (b,c) = a in match b with | d::t -> (((d * 10) :: t), t) | _ -> a in
  let base = ((1 :: l2), [0]) in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(17,11)-(31,34)
let f =
  fun a ->
    fun x ->
      (let (b , c) = a in
       match b with
       | d :: t -> ((d * 10) :: t , t)
       | _ -> a) in
let base = (1 :: l2 , [0]) in
let args = List.rev l1 in
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [LamG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Let (Just (3,2)-(6,75)) NonRec [(VarPat (Just (3,6)-(3,7)) "f",Lam (Just (3,8)-(4,73)) (VarPat (Just (3,8)-(3,9)) "a") (Lam (Just (3,10)-(4,73)) (VarPat (Just (3,10)-(3,11)) "x") (Let (Just (4,4)-(4,73)) NonRec [(TuplePat (Just (4,9)-(4,12)) [VarPat (Just (4,9)-(4,10)) "b",VarPat (Just (4,11)-(4,12)) "c"],Var (Just (4,16)-(4,17)) "a")] (Case (Just (4,21)-(4,73)) (Var (Just (4,27)-(4,28)) "b") [(ConsPat (Just (4,36)-(4,40)) (VarPat (Just (4,36)-(4,37)) "d") (VarPat (Just (4,39)-(4,40)) "t"),Nothing,Tuple (Just (4,44)-(4,64)) [ConApp (Just (4,45)-(4,60)) "::" (Just (Tuple (Just (4,46)-(4,59)) [Bop (Just (4,46)-(4,54)) Times (Var (Just (4,47)-(4,48)) "d") (Lit (Just (4,51)-(4,53)) (LI 10)),Var (Just (4,58)-(4,59)) "t"])) Nothing,Var (Just (4,62)-(4,63)) "t"]),(WildPat (Just (4,67)-(4,68)),Nothing,Var (Just (4,72)-(4,73)) "a")])) Nothing) Nothing)] (Let (Just (5,2)-(6,75)) NonRec [(VarPat (Just (5,6)-(5,10)) "base",Tuple (Just (5,13)-(5,29)) [ConApp (Just (5,14)-(5,23)) "::" (Just (Tuple (Just (5,15)-(5,22)) [Lit (Just (5,15)-(5,16)) (LI 1),Var (Just (5,20)-(5,22)) "l2"])) Nothing,List (Just (5,25)-(5,28)) [Lit (Just (5,26)-(5,27)) (LI 0)] Nothing])] (Let (Just (6,2)-(6,75)) NonRec [(VarPat (Just (6,6)-(6,10)) "args",App (Just (6,13)-(6,24)) (Var (Just (6,13)-(6,21)) "List.rev") [Var (Just (6,22)-(6,24)) "l1"])] (Let (Just (6,28)-(6,75)) NonRec [(TuplePat (Just (6,33)-(6,38)) [WildPat (Just (6,33)-(6,34)),VarPat (Just (6,35)-(6,38)) "res"],App (Just (6,42)-(6,68)) (Var (Just (6,42)-(6,56)) "List.fold_left") [Var (Just (6,57)-(6,58)) "f",Var (Just (6,59)-(6,63)) "base",Var (Just (6,64)-(6,68)) "args"])] (Var (Just (6,72)-(6,75)) "res"))))
*)

(* typed spans
(3,2)-(6,75)
*)

(* correct types
int list
*)

(* bad types
int list -> int list -> int list
*)
