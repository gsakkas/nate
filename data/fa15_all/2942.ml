
let rec clone x n = if n <= 0 then [] else List.append [x] (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then (l1, (List.append (clone 0 (x - y)) l2))
  else if x < y then ((List.append (clone 0 (y - x)) l1), l2) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | (first,second) -> 1 in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else List.append [x] (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then (l1, (List.append (clone 0 (x - y)) l2))
  else if x < y then ((List.append (clone 0 (y - x)) l1), l2) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (lh1,lh2) = x in
      let (carry,res) = a in
      let num = (lh1 + lh2) + carry in ((num / 10), ((num mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,16)-(16,50)
let (lh1 , lh2) = x in
let (carry , res) = a in
let num =
  (lh1 + lh2) + carry in
(num / 10 , (num mod 10) :: res)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(17,15)-(17,17)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG])

*)

(* changed exprs
Let (Just (17,6)-(19,74)) NonRec [(TuplePat (Just (17,11)-(17,18)) [VarPat (Just (17,11)-(17,14)) "lh1",VarPat (Just (17,15)-(17,18)) "lh2"],Var (Just (17,22)-(17,23)) "x")] (Let (Just (18,6)-(19,74)) NonRec [(TuplePat (Just (18,11)-(18,20)) [VarPat (Just (18,11)-(18,16)) "carry",VarPat (Just (18,17)-(18,20)) "res"],Var (Just (18,24)-(18,25)) "a")] (Let (Just (19,6)-(19,74)) NonRec [(VarPat (Just (19,10)-(19,13)) "num",Bop (Just (19,16)-(19,35)) Plus (Bop (Just (19,16)-(19,27)) Plus (Var (Just (19,17)-(19,20)) "lh1") (Var (Just (19,23)-(19,26)) "lh2")) (Var (Just (19,30)-(19,35)) "carry"))] (Tuple (Just (19,39)-(19,74)) [Bop (Just (19,40)-(19,50)) Div (Var (Just (19,41)-(19,44)) "num") (Lit (Just (19,47)-(19,49)) (LI 10)),ConApp (Just (19,52)-(19,73)) "::" (Just (Tuple (Just (19,53)-(19,72)) [Bop (Just (19,53)-(19,65)) Mod (Var (Just (19,54)-(19,57)) "num") (Lit (Just (19,62)-(19,64)) (LI 10)),Var (Just (19,69)-(19,72)) "res"])) Nothing])))
Tuple (Just (20,15)-(20,22)) [Lit (Just (20,16)-(20,17)) (LI 0),List (Just (20,19)-(20,21)) [] Nothing]
*)

(* typed spans
(17,6)-(19,74)
(20,15)-(20,22)
*)

(* correct types
(int * int list)
(int * int list)
*)

(* bad types
int
'a list
*)
