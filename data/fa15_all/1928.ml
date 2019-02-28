
let rec digitsOfInt n =
  let digit = n mod 10
  and r = n / 10 in
  match n with | _ when n <= 0 -> [] | _ when n > 0 -> [digitsOfInt r; digit];;


(* fix

let rec digitsOfInt n =
  let digit = n mod 10
  and r = n / 10 in
  match n with
  | _ when n <= 0 -> []
  | _ when n > 0 -> (digitsOfInt r) @ [digit];;

*)

(* changed spans
(5,55)-(5,77)
digitsOfInt r @ [digit]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (7,20)-(7,45)) (Var (Just (7,36)-(7,37)) "@") [App (Just (7,20)-(7,35)) (Var (Just (7,21)-(7,32)) "digitsOfInt") [Var (Just (7,33)-(7,34)) "r"],List (Just (7,38)-(7,45)) [Var (Just (7,39)-(7,44)) "digit"] Nothing]
*)

(* typed spans
(7,20)-(7,45)
*)

(* correct types
int list
*)

(* bad types
int list
*)
