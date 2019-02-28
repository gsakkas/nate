
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      if (x1 + x2) > 10
      then (1, (((x1 + x2) + a1) - 10))
      else (0, ((x1 + x2) + a1)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      if (x1 + x2) > 10
      then (1, ((((x1 + x2) + a1) - 10) :: a2))
      else (0, (((x1 + x2) + a1) :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,15)-(19,38)
(((x1 + x2) + a1) - 10) :: a2
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG VarG VarG) VarG) LitG])))

(20,15)-(20,31)
((x1 + x2) + a1) :: a2
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG VarG) VarG])))

(21,4)-(23,51)
a2
VarG

*)

(* changed exprs
ConApp (Just (19,15)-(19,46)) "::" (Just (Tuple (Just (19,16)-(19,45)) [Bop (Just (19,16)-(19,39)) Minus (Bop (Just (19,17)-(19,33)) Plus (Bop (Just (19,18)-(19,27)) Plus (Var (Just (19,19)-(19,21)) "x1") (Var (Just (19,24)-(19,26)) "x2")) (Var (Just (19,30)-(19,32)) "a1")) (Lit (Just (19,36)-(19,38)) (LI 10)),Var (Just (19,43)-(19,45)) "a2"])) Nothing
ConApp (Just (20,15)-(20,39)) "::" (Just (Tuple (Just (20,16)-(20,38)) [Bop (Just (20,16)-(20,32)) Plus (Bop (Just (20,17)-(20,26)) Plus (Var (Just (20,18)-(20,20)) "x1") (Var (Just (20,23)-(20,25)) "x2")) (Var (Just (20,29)-(20,31)) "a1"),Var (Just (20,36)-(20,38)) "a2"])) Nothing
Var (Just (20,36)-(20,38)) "a2"
*)

(* typed spans
(19,15)-(19,46)
(20,15)-(20,39)
(20,36)-(20,38)
*)

(* correct types
int list
int list
int list
*)

(* bad types
int
int
int list
*)
