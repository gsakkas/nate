
let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec mulByDigit i l =
  let f a x =
    let y = i * x in
    match a with
    | h::t -> ((h + y) / 10) :: ((h + y) mod 10) :: t
    | _ -> [y / 10; y mod 10] in
  let base = [] in removeZero (List.fold_left f base (List.rev l));;

let bigMul l1 l2 =
  let f a x = ((mulByDigit x l1) @ (clone 0 (List.length a))) :: a in
  let base = [] in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec mulByDigit i l =
  let f a x =
    let y = i * x in
    match a with
    | h::t -> ((h + y) / 10) :: ((h + y) mod 10) :: t
    | _ -> [y / 10; y mod 10] in
  let base = [] in removeZero (List.fold_left f base (List.rev l));;

let bigMul l1 l2 =
  let f a x = ((mulByDigit x l1) @ (clone 0 (List.length a))) @ a in
  let base = [] in
  let args = List.rev l2 in let res = List.fold_left f base args in res;;

*)

(* changed spans
(16,14)-(16,66)
(mulByDigit x l1 @ clone 0
                         (List.length a)) @ a
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(18,28)-(18,75)
let res =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) VarG

*)

(* changed exprs
App (Just (16,14)-(16,65)) (Var (Just (16,62)-(16,63)) "@") [App (Just (16,14)-(16,61)) (Var (Just (16,33)-(16,34)) "@") [App (Just (16,15)-(16,32)) (Var (Just (16,16)-(16,26)) "mulByDigit") [Var (Just (16,27)-(16,28)) "x",Var (Just (16,29)-(16,31)) "l1"],App (Just (16,35)-(16,60)) (Var (Just (16,36)-(16,41)) "clone") [Lit (Just (16,42)-(16,43)) (LI 0),App (Just (16,44)-(16,59)) (Var (Just (16,45)-(16,56)) "List.length") [Var (Just (16,57)-(16,58)) "a"]]],Var (Just (16,64)-(16,65)) "a"]
Let (Just (18,28)-(18,71)) NonRec [(VarPat (Just (18,32)-(18,35)) "res",App (Just (18,38)-(18,64)) (Var (Just (18,38)-(18,52)) "List.fold_left") [Var (Just (18,53)-(18,54)) "f",Var (Just (18,55)-(18,59)) "base",Var (Just (18,60)-(18,64)) "args"])] (Var (Just (18,68)-(18,71)) "res")
*)

(* typed spans
(16,14)-(16,65)
(18,28)-(18,71)
*)

(* correct types
int list
int list
*)

(* bad types
int list list
'a
*)
