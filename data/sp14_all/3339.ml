
let rec mulByDigit i l =
  match List.rev l with
  | [] -> 0
  | h::t ->
      (match ((mulByDigit i (List.rev t)) * 10) + (h * i) with
       | n ->
           let rec helper acc v =
             if v = 0 then 0 :: acc else helper ((v mod 10) :: acc) (v / 10) in
           helper [] n);;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      helper [] h;;

*)

(* changed spans
(3,8)-(3,18)
l
VarG

(6,6)-(10,23)
[]
ListG EmptyG

*)

(* changed exprs
Var (Just (3,8)-(3,9)) "l"
List (Just (4,10)-(4,12)) [] Nothing
*)

(* typed spans
(3,8)-(3,9)
(4,10)-(4,12)
*)

(* correct types
int list
int list
*)

(* bad types
int list
int list
*)
