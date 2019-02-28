
let y f g x = f (g x);;

let rec mulByDigit i l =
  let f a x =
    match a with
    | [] -> (i * x) :: a
    | h::t -> [(x * y) + (h / 10); h mod 10] @ t in
  let base = [] in let args = List.rev (0 :: l) in List.fold_left f base args;;


(* fix

let rec mulByDigit i l =
  let f a x =
    match a with
    | [] -> (i * x) :: a
    | h::t -> [(i * x) + (h / 10); h mod 10] @ t in
  let base = [] in let args = List.rev (0 :: l) in List.fold_left f base args;;

*)

(* changed spans
(8,15)-(8,22)
i
VarG

*)

(* changed exprs
Var (Just (6,16)-(6,17)) "i"
*)

(* typed spans
(6,16)-(6,17)
*)

(* correct types
int
*)

(* bad types
int
*)
