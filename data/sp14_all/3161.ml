
let l1 = [0; 0; 9; 9];;

let l2 = [1; 0; 0; 2];;

let x = (3, 3) :: (List.rev (List.combine l1 l2));;

let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else x :: xs;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (o,p) = a in
      let (d1,d2) = x in
      ((((d1 + d2) + o) / 10), ((((d1 + d2) + o) mod 10) :: p)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add ((padZero 0) :: (l1 0) :: l2));;


(* fix

let l1 = [0; 0; 9; 9];;

let l2 = [1; 0; 0; 2];;

let x = (3, 3) :: (List.rev (List.combine l1 l2));;

let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else x :: xs;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (o,p) = a in
      let (d1,d2) = x in
      ((((d1 + d2) + o) / 10), ((((d1 + d2) + o) mod 10) :: p)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(28,41)-(28,43)
0 :: l2
ConAppG (Just (TupleG (fromList [VarG,LitG])))

(30,18)-(30,47)
padZero l1 l2
AppG (fromList [VarG])

*)

(* changed exprs
ConApp (Just (28,41)-(28,50)) "::" (Just (Tuple (Just (28,42)-(28,49)) [Lit (Just (28,42)-(28,43)) (LI 0),Var (Just (28,47)-(28,49)) "l2"])) Nothing
App (Just (30,18)-(30,33)) (Var (Just (30,19)-(30,26)) "padZero") [Var (Just (30,27)-(30,29)) "l1",Var (Just (30,30)-(30,32)) "l2"]
*)

(* typed spans
(28,41)-(28,50)
(30,18)-(30,33)
*)

(* correct types
int list
(int list * int list)
*)

(* bad types
int list
'a list
*)
