
let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  if i <= 0
  then []
  else
    (match List.rev l with
     | [] -> []
     | h::t ->
         (match t with
          | [] -> [remainder i h]
          | h'::t' -> (h' * i) @ (mulByDigit i t')));;


(* fix

let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  if i <= 0
  then []
  else
    (match List.rev l with
     | [] -> []
     | h::t ->
         (match t with
          | [] -> [remainder i h]
          | h'::t' -> [h' * i] @ (mulByDigit i t')));;

*)

(* changed spans
(13,22)-(13,30)
[h' * i]
ListG (BopG EmptyG EmptyG)

*)

(* changed exprs
List (Just (13,22)-(13,30)) [Bop (Just (13,23)-(13,29)) Times (Var (Just (13,23)-(13,25)) "h'") (Var (Just (13,28)-(13,29)) "i")] Nothing
*)

(* typed spans
(13,22)-(13,30)
*)

(* correct types
int list
*)

(* bad types
int
*)
