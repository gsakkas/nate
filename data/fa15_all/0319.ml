
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
      if ((x1 + x2) + carry) / 10
      then (1, ((((x1 + x2) + carry) mod 10) :: accList))
      else (0, ((x1 + x2) :: accList)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


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
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,6)-(18,38)
(((x1 + x2) + carry) / 10 , (((x1 + x2) + carry) mod 10) :: accList)
TupleG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG)])

*)

(* changed exprs
Tuple (Just (16,6)-(16,77)) [Bop (Just (16,7)-(16,33)) Div (Bop (Just (16,8)-(16,27)) Plus (Bop (Just (16,9)-(16,18)) Plus (Var (Just (16,10)-(16,12)) "x1") (Var (Just (16,15)-(16,17)) "x2")) (Var (Just (16,21)-(16,26)) "carry")) (Lit (Just (16,30)-(16,32)) (LI 10)),ConApp (Just (16,35)-(16,76)) "::" (Just (Tuple (Just (16,36)-(16,75)) [Bop (Just (16,36)-(16,64)) Mod (Bop (Just (16,37)-(16,56)) Plus (Bop (Just (16,38)-(16,47)) Plus (Var (Just (16,39)-(16,41)) "x1") (Var (Just (16,44)-(16,46)) "x2")) (Var (Just (16,50)-(16,55)) "carry")) (Lit (Just (16,61)-(16,63)) (LI 10)),Var (Just (16,68)-(16,75)) "accList"])) Nothing]
*)

(* typed spans
(16,6)-(16,77)
*)

(* correct types
(int * int list)
*)

(* bad types
(int * int list)
*)
