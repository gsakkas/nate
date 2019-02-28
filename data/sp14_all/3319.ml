
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::m::t ->
      ((mulByDigit m) :: t) @
        [((h * i) / 10) + ((m * i) mod 10); (h * i) mod 10];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::m::t ->
      (mulByDigit i (m :: t)) @
        [((h * i) / 10) + ((m * i) mod 10); (h * i) mod 10];;

*)

(* changed spans
(6,6)-(6,27)
mulByDigit i (m :: t)
AppG (fromList [VarG,ConAppG (Just (TupleG (fromList [VarG])))])

*)

(* changed exprs
App (Just (6,6)-(6,29)) (Var (Just (6,7)-(6,17)) "mulByDigit") [Var (Just (6,18)-(6,19)) "i",ConApp (Just (6,20)-(6,28)) "::" (Just (Tuple (Just (6,21)-(6,27)) [Var (Just (6,21)-(6,22)) "m",Var (Just (6,26)-(6,27)) "t"])) Nothing]
*)

(* typed spans
(6,6)-(6,29)
*)

(* correct types
int list
*)

(* bad types
int list
*)
