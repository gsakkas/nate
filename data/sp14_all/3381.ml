
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      helper h;;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      helper [] h;;

*)

(* changed spans
(8,6)-(8,14)
helper [] h
AppG (fromList [VarG,ListG EmptyG])

*)

(* changed exprs
App (Just (8,6)-(8,17)) (Var (Just (8,6)-(8,12)) "helper") [List (Just (8,13)-(8,15)) [] Nothing,Var (Just (8,16)-(8,17)) "h"]
*)

(* typed spans
(8,6)-(8,17)
*)

(* correct types
int list
*)

(* bad types
int -> int list
*)
