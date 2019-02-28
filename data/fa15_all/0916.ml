
let rec removeZero l =
  let f a x =
    if (List.length a) = 0 then (if x = 0 then [] else [x]) else a @ [x] in
  let base = [] in List.fold_left f base l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (l1e,l2e) ->
          (match a with
           | (carry,list) ->
               let num = (l1e + l2e) + carry in ((num mod 9), ([7] @ list))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (l1 (if l1 > l2 then l1 else l2)));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone 0 ((List.length l2) - (List.length l1))) @ l1
  else (clone 0 ((List.length l1) - (List.length l2))) @ l2;;

let rec removeZero l =
  let f a x =
    if (List.length a) = 0 then (if x = 0 then [] else [x]) else a @ [x] in
  let base = [] in List.fold_left f base l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (l1e,l2e) ->
          (match a with
           | (carry,list) ->
               let num = (l1e + l2e) + carry in ((num mod 9), ([7] @ list))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add ((padZero l1 l2), l2));;

*)

(* changed spans
(2,19)-(5,42)
fun x ->
  fun n ->
    if n <= 0
    then []
    else x :: (clone x (n - 1))
LamG (LamG EmptyG)

(2,19)-(5,42)
fun l1 ->
  fun l2 ->
    if List.length l1 < List.length l2
    then clone 0
               (List.length l2 - List.length l1) @ l1
    else clone 0
               (List.length l1 - List.length l2) @ l2
LamG (LamG EmptyG)

(18,18)-(18,51)
(padZero l1 l2 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
Lam (Just (2,14)-(2,65)) (VarPat (Just (2,14)-(2,15)) "x") (Lam (Just (2,16)-(2,65)) (VarPat (Just (2,16)-(2,17)) "n") (Ite (Just (2,20)-(2,65)) (Bop (Just (2,23)-(2,29)) Le (Var (Just (2,23)-(2,24)) "n") (Lit (Just (2,28)-(2,29)) (LI 0))) (List (Just (2,35)-(2,37)) [] Nothing) (ConApp (Just (2,43)-(2,65)) "::" (Just (Tuple (Just (2,43)-(2,65)) [Var (Just (2,43)-(2,44)) "x",App (Just (2,48)-(2,65)) (Var (Just (2,49)-(2,54)) "clone") [Var (Just (2,55)-(2,56)) "x",Bop (Just (2,57)-(2,64)) Minus (Var (Just (2,58)-(2,59)) "n") (Lit (Just (2,62)-(2,63)) (LI 1))]])) Nothing)) Nothing) Nothing
Lam (Just (4,12)-(7,59)) (VarPat (Just (4,12)-(4,14)) "l1") (Lam (Just (4,15)-(7,59)) (VarPat (Just (4,15)-(4,17)) "l2") (Ite (Just (5,2)-(7,59)) (Bop (Just (5,5)-(5,40)) Lt (App (Just (5,5)-(5,21)) (Var (Just (5,6)-(5,17)) "List.length") [Var (Just (5,18)-(5,20)) "l1"]) (App (Just (5,24)-(5,40)) (Var (Just (5,25)-(5,36)) "List.length") [Var (Just (5,37)-(5,39)) "l2"])) (App (Just (6,7)-(6,59)) (Var (Just (6,55)-(6,56)) "@") [App (Just (6,7)-(6,54)) (Var (Just (6,8)-(6,13)) "clone") [Lit (Just (6,14)-(6,15)) (LI 0),Bop (Just (6,16)-(6,53)) Minus (App (Just (6,17)-(6,33)) (Var (Just (6,18)-(6,29)) "List.length") [Var (Just (6,30)-(6,32)) "l2"]) (App (Just (6,36)-(6,52)) (Var (Just (6,37)-(6,48)) "List.length") [Var (Just (6,49)-(6,51)) "l1"])],Var (Just (6,57)-(6,59)) "l1"]) (App (Just (7,7)-(7,59)) (Var (Just (7,55)-(7,56)) "@") [App (Just (7,7)-(7,54)) (Var (Just (7,8)-(7,13)) "clone") [Lit (Just (7,14)-(7,15)) (LI 0),Bop (Just (7,16)-(7,53)) Minus (App (Just (7,17)-(7,33)) (Var (Just (7,18)-(7,29)) "List.length") [Var (Just (7,30)-(7,32)) "l1"]) (App (Just (7,36)-(7,52)) (Var (Just (7,37)-(7,48)) "List.length") [Var (Just (7,49)-(7,51)) "l2"])],Var (Just (7,57)-(7,59)) "l2"])) Nothing) Nothing
Tuple (Just (25,18)-(25,39)) [App (Just (25,19)-(25,34)) (Var (Just (25,20)-(25,27)) "padZero") [Var (Just (25,28)-(25,30)) "l1",Var (Just (25,31)-(25,33)) "l2"],Var (Just (25,36)-(25,38)) "l2"]
*)

(* typed spans
(2,14)-(2,65)
(4,12)-(7,59)
(25,18)-(25,39)
*)

(* correct types
int -> int -> int list
int list -> int list -> int list
(int list * int list)
*)

(* bad types
int list -> int list
int list -> int list
(int list * int list)
*)
