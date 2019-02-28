
let rec clone x n =
  match n with | y when y <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) <= (List.length l2) with
  | true  ->
      ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  | false  ->
      (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = (fst x) + (snd x) in
      match a with
      | [] -> (sum / 10) :: (sum mod 10) :: a
      | h::t -> (sum / 10) :: (h + (sum mod 10)) :: t in
    let base = [] in
    let args = List.combine List.rev l1 List.rev l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | y when y <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) <= (List.length l2) with
  | true  ->
      ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  | false  ->
      (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = (fst x) + (snd x) in
      match a with
      | [] -> (sum / 10) :: (sum mod 10) :: a
      | h::t -> (sum / 10) :: (h + (sum mod 10)) :: t in
    let base = [] in
    let args = List.combine (List.rev l1) (List.rev l2) in
    List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(25,15)-(25,51)
List.combine (List.rev l1)
             (List.rev l2)
AppG (fromList [AppG (fromList [EmptyG])])

(26,4)-(26,51)
List.fold_left f base args
AppG (fromList [VarG])

(26,4)-(26,51)
List.fold_left
VarG

*)

(* changed exprs
App (Just (25,15)-(25,55)) (Var (Just (25,15)-(25,27)) "List.combine") [App (Just (25,28)-(25,41)) (Var (Just (25,29)-(25,37)) "List.rev") [Var (Just (25,38)-(25,40)) "l1"],App (Just (25,42)-(25,55)) (Var (Just (25,43)-(25,51)) "List.rev") [Var (Just (25,52)-(25,54)) "l2"]]
App (Just (26,4)-(26,30)) (Var (Just (26,4)-(26,18)) "List.fold_left") [Var (Just (26,19)-(26,20)) "f",Var (Just (26,21)-(26,25)) "base",Var (Just (26,26)-(26,30)) "args"]
Var (Just (26,4)-(26,18)) "List.fold_left"
*)

(* typed spans
(25,15)-(25,55)
(26,4)-(26,30)
(26,4)-(26,18)
*)

(* correct types
(int * int) list
int list
(int list -> (int * int) -> int list) -> int list -> (int * int) list -> int list
*)

(* bad types
(int * int) list
int list
int list
*)
