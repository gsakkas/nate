
let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let y = [1; 2; 3];;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      if (List.length t) = 0
      then (h * i) @ (mulByDigit i t)
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
(11,19)-(11,20)
[h * i]
ListG (BopG EmptyG EmptyG)

(12,27)-(12,28)
[remainder i h]
ListG (AppG (fromList [EmptyG]))

(12,12)-(12,21)
i
VarG

*)

(* changed exprs
List (Just (9,11)-(9,18)) [Bop (Just (9,12)-(9,17)) Times (Var (Just (9,12)-(9,13)) "h") (Var (Just (9,16)-(9,17)) "i")] Nothing
List (Just (10,11)-(10,26)) [App (Just (10,12)-(10,25)) (Var (Just (10,12)-(10,21)) "remainder") [Var (Just (10,22)-(10,23)) "i",Var (Just (10,24)-(10,25)) "h"]] Nothing
Var (Just (10,22)-(10,23)) "i"
*)

(* typed spans
(9,11)-(9,18)
(10,11)-(10,26)
(10,22)-(10,23)
*)

(* correct types
int list
int list
int
*)

(* bad types
'a list -> 'a list -> 'a list
'a list -> 'a list -> 'a list
int -> int -> int
*)
