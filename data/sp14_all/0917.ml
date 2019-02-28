
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  (((clone 0 (leng2 - leng1)) @ l1), ((clone 0 (leng1 - leng2)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "to be implemented" in
    let base = failwith "to be implemeneted" in
    let args = List.combine l1 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  (((clone 0 (leng2 - leng1)) @ l1), ((clone 0 (leng1 - leng2)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(14,16)-(14,44)
a
VarG

(15,15)-(15,44)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG])

(16,15)-(16,30)
List.combine l1 l2
AppG (fromList [VarG])

*)

(* changed exprs
Var (Just (14,16)-(14,17)) "a"
Tuple (Just (15,15)-(15,22)) [Lit (Just (15,16)-(15,17)) (LI 0),List (Just (15,19)-(15,21)) [] Nothing]
App (Just (16,15)-(16,33)) (Var (Just (16,15)-(16,27)) "List.combine") [Var (Just (16,28)-(16,30)) "l1",Var (Just (16,31)-(16,33)) "l2"]
*)

(* typed spans
(14,16)-(14,17)
(15,15)-(15,22)
(16,15)-(16,33)
*)

(* correct types
(int * int list)
(int * int list)
(int * int) list
*)

(* bad types
'a
'a
'a list -> (int * 'a) list
*)
