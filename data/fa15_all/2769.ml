
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
              if (i * h) > 10 then [carry i h] @ [remainder i h] else i * h
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
              if (i * h) > 10 then [carry i h] @ [remainder i h] else [i * h]
          | h'::t' ->
              (mulByDigit i t') @
                ([(remainder h' i) + (carry h i)] @ [remainder h i])));;

*)

(* changed spans
(15,70)-(15,75)
[i * h]
ListG (BopG EmptyG EmptyG)

*)

(* changed exprs
List (Just (15,70)-(15,77)) [Bop (Just (15,71)-(15,76)) Times (Var (Just (15,71)-(15,72)) "i") (Var (Just (15,75)-(15,76)) "h")] Nothing
*)

(* typed spans
(15,70)-(15,77)
*)

(* correct types
int list
*)

(* bad types
int
*)
