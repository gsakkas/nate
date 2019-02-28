
let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) = (List.length l2) with
  | true  -> (l1, l2)
  | false  ->
      let lendiff = (List.length l1) - (List.length l2) in
      (match lendiff > 0 with
       | true  -> (l1, ((clone 0 lendiff) @ l2))
       | false  -> (((clone 0 (- lendiff)) @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a (x,y) =
      match a with
      | [] -> (x + y) :: a
      | h::t -> [(x + y) + (h / 10); h mod 10] @ t in
    let base = [] in
    let args = List.rev ((0, 0) :: (List.combine l1 l2)) in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f a x =
    match a with
    | [] -> (i * x) :: a
    | h::t -> [(i * x) + (h / 10); h mod 10] @ t in
  let base = [] in
  let args = List.rev (0 :: l) in removeZero (List.fold_left f base args);;

let bigMul l1 l2 =
  let f a x =
    match a with
    | [] -> mulByDigit x l2
    | _ -> bigAdd List.rev (0 :: (List.rev a)) (mulByDigit x l2) in
  let base = [] in
  let args = List.rev l1 in let res = List.fold_left f base args in res;;


(* fix

let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) = (List.length l2) with
  | true  -> (l1, l2)
  | false  ->
      let lendiff = (List.length l1) - (List.length l2) in
      (match lendiff > 0 with
       | true  -> (l1, ((clone 0 lendiff) @ l2))
       | false  -> (((clone 0 (- lendiff)) @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a (x,y) =
      match a with
      | [] -> (x + y) :: a
      | h::t -> [(x + y) + (h / 10); h mod 10] @ t in
    let base = [] in
    let args = List.rev ((0, 0) :: (List.combine l1 l2)) in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f a x =
    match a with
    | [] -> (i * x) :: a
    | h::t -> [(i * x) + (h / 10); h mod 10] @ t in
  let base = [] in
  let args = List.rev (0 :: l) in removeZero (List.fold_left f base args);;

let bigMul l1 l2 =
  let f a x =
    match a with
    | [] -> mulByDigit x l2
    | _ -> bigAdd (List.rev (0 :: (List.rev a))) (mulByDigit x l2) in
  let base = [] in
  let args = List.rev l1 in let res = List.fold_left f base args in res;;

*)

(* changed spans
(40,11)-(40,64)
bigAdd (List.rev (0 :: (List.rev a)))
       (mulByDigit x l2)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (40,11)-(40,66)) (Var (Just (40,11)-(40,17)) "bigAdd") [App (Just (40,18)-(40,48)) (Var (Just (40,19)-(40,27)) "List.rev") [ConApp (Just (40,28)-(40,47)) "::" (Just (Tuple (Just (40,29)-(40,46)) [Lit (Just (40,29)-(40,30)) (LI 0),App (Just (40,34)-(40,46)) (Var (Just (40,35)-(40,43)) "List.rev") [Var (Just (40,44)-(40,45)) "a"]])) Nothing],App (Just (40,49)-(40,66)) (Var (Just (40,50)-(40,60)) "mulByDigit") [Var (Just (40,61)-(40,62)) "x",Var (Just (40,63)-(40,65)) "l2"]]
*)

(* typed spans
(40,11)-(40,66)
*)

(* correct types
int list
*)

(* bad types
int list
*)
