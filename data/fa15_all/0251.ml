
let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let rec clone x n = if n < 1 then [] else cloneHelper x n [];;

let addition (x,y) = x + y;;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then (((clone 0 ((-1) * diff)) @ l1), l2)
  else if diff > 0 then (l1, ((clone 0 diff) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | hd::tl -> if hd = 0 then removeZero tl else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (m,n) = x in
      let (y,z) = a in
      (((((addition (m, n)) + y) / 10) @ z),
        ([((addition (m, n)) + y) mod 10] @ z)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let rec clone x n = if n < 1 then [] else cloneHelper x n [];;

let addition (x,y) = x + y;;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then (((clone 0 ((-1) * diff)) @ l1), l2)
  else if diff > 0 then (l1, ((clone 0 diff) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | hd::tl -> if hd = 0 then removeZero tl else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (m,n) = x in
      let (y,z) = a in
      ((((addition (m, n)) + y) / 10),
        ([((addition (m, n)) + y) mod 10] @ z)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,7)-(23,43)
(addition (m , n) + y) / 10
BopG (BopG EmptyG EmptyG) LitG

(26,15)-(26,44)
List.combine l1 l2
AppG (fromList [VarG])

(26,15)-(26,44)
List.combine
VarG

(26,15)-(26,44)
l1
VarG

(26,15)-(26,44)
l2
VarG

*)

(* changed exprs
Bop (Just (23,7)-(23,37)) Div (Bop (Just (23,8)-(23,31)) Plus (App (Just (23,9)-(23,26)) (Var (Just (23,10)-(23,18)) "addition") [Tuple (Just (23,19)-(23,25)) [Var (Just (23,20)-(23,21)) "m",Var (Just (23,23)-(23,24)) "n"]]) (Var (Just (23,29)-(23,30)) "y")) (Lit (Just (23,34)-(23,36)) (LI 10))
App (Just (26,15)-(26,33)) (Var (Just (26,15)-(26,27)) "List.combine") [Var (Just (26,28)-(26,30)) "l1",Var (Just (26,31)-(26,33)) "l2"]
Var (Just (26,15)-(26,27)) "List.combine"
Var (Just (26,28)-(26,30)) "l1"
Var (Just (26,31)-(26,33)) "l2"
*)

(* typed spans
(23,7)-(23,37)
(26,15)-(26,33)
(26,15)-(26,27)
(26,28)-(26,30)
(26,31)-(26,33)
*)

(* correct types
int
(int * int) list
int list -> int list -> (int * int) list
int list
int list
*)

(* bad types
int
(int * int) list
(int * int) list
(int * int) list
(int * int) list
*)
