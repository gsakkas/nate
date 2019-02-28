
let carry x y = (x * y) / 10;;

let remainder x y = (x * y) mod 10;;

let rec mulByDigit i l =
  if (i = 0) || (i > 9)
  then []
  else
    (match List.rev l with
     | [] -> []
     | h::t ->
         (match t with
          | [] -> if (i * h) > 10 then [carry i h] @ [remainder i h]
          | h'::t' ->
              (mulByDigit i t') @
                ([(remainder h' i) + (carry h i)] @ [remainder h i])));;


(* fix

let carry x y = (x * y) / 10;;

let remainder x y = (x * y) mod 10;;

let rec mulByDigit i l =
  if (i = 0) || (i > 9)
  then []
  else
    (match List.rev l with
     | [] -> []
     | h::t ->
         (match t with
          | [] ->
              if (i * h) > 10
              then [carry i h] @ [remainder i h]
              else [remainder i h]
          | h'::t' ->
              (mulByDigit i t') @
                ([(remainder h' i) + (carry h i)] @ [remainder h i])));;

*)

(* changed spans
(14,18)-(14,68)
[remainder i h]
ListG (AppG (fromList [EmptyG]))

(16,32)-(16,33)
mulByDigit i
           t' @ ([remainder h'
                            i + carry h i] @ [remainder h
                                                        i])
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
List (Just (17,19)-(17,34)) [App (Just (17,20)-(17,33)) (Var (Just (17,20)-(17,29)) "remainder") [Var (Just (17,30)-(17,31)) "i",Var (Just (17,32)-(17,33)) "h"]] Nothing
App (Just (19,14)-(20,68)) (Var (Just (19,32)-(19,33)) "@") [App (Just (19,14)-(19,31)) (Var (Just (19,15)-(19,25)) "mulByDigit") [Var (Just (19,26)-(19,27)) "i",Var (Just (19,28)-(19,30)) "t'"],App (Just (20,16)-(20,68)) (Var (Just (20,50)-(20,51)) "@") [List (Just (20,17)-(20,49)) [Bop (Just (20,18)-(20,48)) Plus (App (Just (20,18)-(20,34)) (Var (Just (20,19)-(20,28)) "remainder") [Var (Just (20,29)-(20,31)) "h'",Var (Just (20,32)-(20,33)) "i"]) (App (Just (20,37)-(20,48)) (Var (Just (20,38)-(20,43)) "carry") [Var (Just (20,44)-(20,45)) "h",Var (Just (20,46)-(20,47)) "i"])] Nothing,List (Just (20,52)-(20,67)) [App (Just (20,53)-(20,66)) (Var (Just (20,53)-(20,62)) "remainder") [Var (Just (20,63)-(20,64)) "h",Var (Just (20,65)-(20,66)) "i"]] Nothing]]
*)

(* typed spans
(17,19)-(17,34)
(19,14)-(20,68)
*)

(* correct types
int list
int list
*)

(* bad types
unit
int list -> int list -> int list
*)
