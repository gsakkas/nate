
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = (0, (x :: a)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (carry,num) = a in let (l1,l2) = x in (0, (l1 :: num)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(13,16)-(13,29)
let (carry , num) = a in
let (l1 , l2) = x in
(0 , l1 :: num)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Let (Just (13,16)-(13,74)) NonRec [(TuplePat (Just (13,21)-(13,30)) [VarPat (Just (13,21)-(13,26)) "carry",VarPat (Just (13,27)-(13,30)) "num"],Var (Just (13,34)-(13,35)) "a")] (Let (Just (13,39)-(13,74)) NonRec [(TuplePat (Just (13,44)-(13,49)) [VarPat (Just (13,44)-(13,46)) "l1",VarPat (Just (13,47)-(13,49)) "l2"],Var (Just (13,53)-(13,54)) "x")] (Tuple (Just (13,58)-(13,74)) [Lit (Just (13,59)-(13,60)) (LI 0),ConApp (Just (13,62)-(13,73)) "::" (Just (Tuple (Just (13,63)-(13,72)) [Var (Just (13,63)-(13,65)) "l1",Var (Just (13,69)-(13,72)) "num"])) Nothing]))
*)

(* typed spans
(13,16)-(13,74)
*)

(* correct types
(int * int list)
*)

(* bad types
(int * 'a list)
*)
