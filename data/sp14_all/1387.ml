
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
  let (_,res) = List.fold_right f base (List.rev l) in res;;


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
(12,16)-(12,31)
List.fold_left
VarG

*)

(* changed exprs
Var (Just (12,16)-(12,30)) "List.fold_left"
*)

(* typed spans
(12,16)-(12,30)
*)

(* correct types
((int * int list) -> int -> (int * int list)) -> (int * int list) -> int list -> (int * int list)
*)

(* bad types
((int * int list) -> int -> int) -> (int * int list) list -> int -> int
*)
