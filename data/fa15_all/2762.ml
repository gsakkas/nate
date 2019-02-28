
let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      if (List.length t) = 0
      then [h * i] @ (mulByDigit i t)
      else [remainder i h] :: (mulByDigit i t);;


(* fix

let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      if (List.length t) = 0
      then [h * i] @ (mulByDigit i t)
      else (remainder i h) :: (mulByDigit i t);;

*)

(* changed spans
(10,11)-(10,26)
remainder i h
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (10,11)-(10,26)) (Var (Just (10,12)-(10,21)) "remainder") [Var (Just (10,22)-(10,23)) "i",Var (Just (10,24)-(10,25)) "h"]
*)

(* typed spans
(10,11)-(10,26)
*)

(* correct types
int
*)

(* bad types
int list
*)
