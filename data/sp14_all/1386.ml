
let rec mulByDigit i l =
  let f a x =
    match a with
    | (carry,rest) ->
        let new_carry = ((i * x) + carry) / 10 in
        let result = (((i * x) + carry) mod 10) :: rest in
        if ((List.length result) = (List.length l)) && (new_carry > 0)
        then (0, (new_carry :: result))
        else (new_carry, result) in
  let base = (0, []) in let (_,res) = List.fold_right f base l in res;;


(* fix

let rec mulByDigit i l =
  let f a x =
    match a with
    | (carry,rest) ->
        let new_carry = ((i * x) + carry) / 10 in
        let result = (((i * x) + carry) mod 10) :: rest in
        if ((List.length result) = (List.length l)) && (new_carry > 0)
        then (0, (new_carry :: result))
        else (new_carry, result) in
  let base = (0, []) in
  let (_,res) = List.fold_left f base (List.rev l) in res;;

*)

(* changed spans
(11,38)-(11,53)
List.fold_left
VarG

(11,61)-(11,62)
List.rev l
AppG (fromList [VarG])

*)

(* changed exprs
Var (Just (12,16)-(12,30)) "List.fold_left"
App (Just (12,38)-(12,50)) (Var (Just (12,39)-(12,47)) "List.rev") [Var (Just (12,48)-(12,49)) "l"]
*)

(* typed spans
(12,16)-(12,30)
(12,38)-(12,50)
*)

(* correct types
((int * int list) -> int -> (int * int list)) -> (int * int list) -> int list -> (int * int list)
int list
*)

(* bad types
((int * int list) -> int -> int) -> (int * int list) list -> int -> int
'a list
*)
