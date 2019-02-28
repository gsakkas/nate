
let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let rec mulByDigit i l =
  let f a x =
    match a with
    | [] -> (i * x) :: a
    | h::t -> [(i * x) + (h / 10); h mod 10] @ t in
  let base = [] in
  let args = List.rev (0 :: l) in removeZero List.fold_left f base args;;


(* fix

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let rec mulByDigit i l =
  let f a x =
    match a with
    | [] -> (i * x) :: a
    | h::t -> [(i * x) + (h / 10); h mod 10] @ t in
  let base = [] in
  let args = List.rev (0 :: l) in removeZero (List.fold_left f base args);;

*)

(* changed spans
(11,34)-(11,71)
removeZero (List.fold_left f
                           base args)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (11,34)-(11,73)) (Var (Just (11,34)-(11,44)) "removeZero") [App (Just (11,45)-(11,73)) (Var (Just (11,46)-(11,60)) "List.fold_left") [Var (Just (11,61)-(11,62)) "f",Var (Just (11,63)-(11,67)) "base",Var (Just (11,68)-(11,72)) "args"]]
*)

(* typed spans
(11,34)-(11,73)
*)

(* correct types
int list
*)

(* bad types
'a
*)
