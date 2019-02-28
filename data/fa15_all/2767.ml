
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
          | h'::t' -> [h' * i] @ [(remainder h) * i]));;


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
          | h'::t' -> [h' * i] @ [remainder h i]));;

*)

(* changed spans
(13,34)-(13,51)
remainder h i
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (13,34)-(13,47)) (Var (Just (13,34)-(13,43)) "remainder") [Var (Just (13,44)-(13,45)) "h",Var (Just (13,46)-(13,47)) "i"]
*)

(* typed spans
(13,34)-(13,47)
*)

(* correct types
int
*)

(* bad types
int
*)
