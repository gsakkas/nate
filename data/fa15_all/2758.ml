
let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let y = [1; 2; 3];;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      if (List.length t) = 0
      then h * i
      else (remainder h y) @ (mulByDigit i t);;


(* fix

let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      if (List.length t) = 0
      then [h * i] @ (mulByDigit i t)
      else [remainder i h] @ (mulByDigit i t);;

*)

(* changed spans
(4,8)-(4,17)
EMPTY
EmptyG

(4,9)-(4,10)
EMPTY
EmptyG

(4,12)-(4,13)
EMPTY
EmptyG

(4,15)-(4,16)
EMPTY
EmptyG

(11,11)-(11,16)
[h * i] @ mulByDigit i t
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(12,11)-(12,26)
[remainder i h]
ListG (AppG (fromList [EmptyG])) Nothing

(12,22)-(12,23)
i
VarG

(12,24)-(12,25)
EMPTY
EmptyG

(12,27)-(12,28)
[remainder i h] @ mulByDigit i
                             t
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

*)
