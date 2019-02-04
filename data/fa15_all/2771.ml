
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
          | [] -> if (i * h) > 10 then [carry i h] @ [remainder i h] else []
          | h'::t' ->
              (mulByDigit i t') @
                ([(carry i h) + (remainder h' i)] @
                   [(remainder h i) + (carry i)])));;


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
          | [] -> if (i * h) > 10 then [carry i h] @ [remainder i h] else []
          | h'::t' ->
              (mulByDigit i t') @
                ([(carry i h) + (remainder h' i)] @ [remainder h i])));;

*)

(* changed spans
(18,20)-(18,47)
EMPTY
EmptyG

(18,38)-(18,47)
EMPTY
EmptyG

(18,39)-(18,44)
EMPTY
EmptyG

(18,45)-(18,46)
EMPTY
EmptyG

*)
