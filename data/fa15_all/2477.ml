
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if not (h = 0) then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (b,c) ->
          (match a with
           | (carry,sum) ->
               (match sum with
                | [] ->
                    if ((carry + b) + c) < 10
                    then (0, [carry; (carry + b) + c])
                    else ((carry + 1), [carry + 1; ((carry + b) + c) mod 10])
                | h::t ->
                    if ((b + c) + h) < 10
                    then (0, ([0] @ ([(b + c) + h] @ t)))
                    else
                      ((carry + 1),
                        ([[((h + b) + c) / 10]; ((h + b) + c) mod 10] @ t)))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if not (h = 0) then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (b,c) ->
          (match a with
           | (carry,sum) ->
               (match sum with
                | [] ->
                    if ((carry + b) + c) < 10
                    then (0, [carry; (carry + b) + c])
                    else ((carry + 1), [carry + 1; ((carry + b) + c) mod 10])
                | h::t ->
                    if ((b + c) + h) < 10
                    then (0, ([0] @ ([(b + c) + h] @ t)))
                    else
                      ((carry + 1),
                        ([((h + b) + c) / 10] @ ([((h + b) + c) mod 10] @ t))))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(32,25)-(32,69)
[((h + b) + c) / 10]
ListG (BopG EmptyG EmptyG)

(32,25)-(32,69)
[((h + b) + c) mod 10] @ t
AppG (fromList [VarG,ListG EmptyG])

*)

(* changed exprs
List (Just (32,25)-(32,45)) [Bop (Just (32,26)-(32,44)) Div (Bop (Just (32,26)-(32,39)) Plus (Bop (Just (32,27)-(32,34)) Plus (Var (Just (32,28)-(32,29)) "h") (Var (Just (32,32)-(32,33)) "b")) (Var (Just (32,37)-(32,38)) "c")) (Lit (Just (32,42)-(32,44)) (LI 10))] Nothing
App (Just (32,48)-(32,76)) (Var (Just (32,72)-(32,73)) "@") [List (Just (32,49)-(32,71)) [Bop (Just (32,50)-(32,70)) Mod (Bop (Just (32,50)-(32,63)) Plus (Bop (Just (32,51)-(32,58)) Plus (Var (Just (32,52)-(32,53)) "h") (Var (Just (32,56)-(32,57)) "b")) (Var (Just (32,61)-(32,62)) "c")) (Lit (Just (32,68)-(32,70)) (LI 10))] Nothing,Var (Just (32,74)-(32,75)) "t"]
*)

(* typed spans
(32,25)-(32,45)
(32,48)-(32,76)
*)

(* correct types
int list
int list
*)

(* bad types
int list list
int list list
*)
