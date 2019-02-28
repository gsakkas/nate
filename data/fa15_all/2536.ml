
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
      match a with
      | [] -> []
      | h::t ->
          let (j,k) = h in
          if (j + k) > 10 then (1, ((j + k) - 10)) else (0, (j + k)) in
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
(16,6)-(20,68)
let (x1 , x2) = x in
let (a1 , a2) = a in
if (x1 + x2) > 10
then (1 , (((x1 + x2) + a1) - 10) :: a2)
else (0 , ((x1 + x2) + a1) :: a2)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Let (Just (16,6)-(20,40)) NonRec [(TuplePat (Just (16,11)-(16,16)) [VarPat (Just (16,11)-(16,13)) "x1",VarPat (Just (16,14)-(16,16)) "x2"],Var (Just (16,20)-(16,21)) "x")] (Let (Just (17,6)-(20,40)) NonRec [(TuplePat (Just (17,11)-(17,16)) [VarPat (Just (17,11)-(17,13)) "a1",VarPat (Just (17,14)-(17,16)) "a2"],Var (Just (17,20)-(17,21)) "a")] (Ite (Just (18,6)-(20,40)) (Bop (Just (18,9)-(18,23)) Gt (Bop (Just (18,9)-(18,18)) Plus (Var (Just (18,10)-(18,12)) "x1") (Var (Just (18,15)-(18,17)) "x2")) (Lit (Just (18,21)-(18,23)) (LI 10))) (Tuple (Just (19,11)-(19,47)) [Lit (Just (19,12)-(19,13)) (LI 1),ConApp (Just (19,15)-(19,46)) "::" (Just (Tuple (Just (19,16)-(19,45)) [Bop (Just (19,16)-(19,39)) Minus (Bop (Just (19,17)-(19,33)) Plus (Bop (Just (19,18)-(19,27)) Plus (Var (Just (19,19)-(19,21)) "x1") (Var (Just (19,24)-(19,26)) "x2")) (Var (Just (19,30)-(19,32)) "a1")) (Lit (Just (19,36)-(19,38)) (LI 10)),Var (Just (19,43)-(19,45)) "a2"])) Nothing]) (Tuple (Just (20,11)-(20,40)) [Lit (Just (20,12)-(20,13)) (LI 0),ConApp (Just (20,15)-(20,39)) "::" (Just (Tuple (Just (20,16)-(20,38)) [Bop (Just (20,16)-(20,32)) Plus (Bop (Just (20,17)-(20,26)) Plus (Var (Just (20,18)-(20,20)) "x1") (Var (Just (20,23)-(20,25)) "x2")) (Var (Just (20,29)-(20,31)) "a1"),Var (Just (20,36)-(20,38)) "a2"])) Nothing])))
*)

(* typed spans
(16,6)-(20,40)
*)

(* correct types
(int * int list)
*)

(* bad types
(int * int) list
*)
