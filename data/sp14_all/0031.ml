
let rec clone x n =
  match n > 0 with | true  -> x :: (clone x (n - 1)) | false  -> [];;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  match length1 >= length2 with
  | true  ->
      let n = length1 - length2 in
      let zeroes = clone 0 n in (l1, (List.append zeroes l2))
  | false  ->
      let n = length2 - length1 in
      let zeroes = clone 0 n in ((List.append zeroes l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = (0, [0; 0; 0; 0]) in
    let base = (0, []) in
    let args = (l1, l2) in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n > 0 with | true  -> x :: (clone x (n - 1)) | false  -> [];;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  match length1 >= length2 with
  | true  ->
      let n = length1 - length2 in
      let zeroes = clone 0 n in (l1, (List.append zeroes l2))
  | false  ->
      let n = length2 - length1 in
      let zeroes = clone 0 n in ((List.append zeroes l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = (0, [0; 0; 0; 0]) in
    let base = (0, l1) in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(25,4)-(25,74)
l1
VarG

(25,4)-(25,74)
let args = l2 in
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Var (Just (24,19)-(24,21)) "l1"
Let (Just (25,4)-(25,68)) NonRec [(VarPat (Just (25,8)-(25,12)) "args",Var (Just (25,15)-(25,17)) "l2")] (Let (Just (25,21)-(25,68)) NonRec [(TuplePat (Just (25,26)-(25,31)) [WildPat (Just (25,26)-(25,27)),VarPat (Just (25,28)-(25,31)) "res"],App (Just (25,35)-(25,61)) (Var (Just (25,35)-(25,49)) "List.fold_left") [Var (Just (25,50)-(25,51)) "f",Var (Just (25,52)-(25,56)) "base",Var (Just (25,57)-(25,61)) "args"])] (Var (Just (25,65)-(25,68)) "res"))
*)

(* typed spans
(24,19)-(24,21)
(25,4)-(25,68)
*)

(* correct types
int list
int list
*)

(* bad types
int list
int list
*)
