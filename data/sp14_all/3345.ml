
let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else (helper (v mod 10)) :: (acc (v / 10)) in
      helper [] h;;


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
(7,31)-(7,68)
helper ((v mod 10) :: acc)
       (v / 10)
AppG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG)])

*)

(* changed exprs
App (Just (7,31)-(7,66)) (Var (Just (7,31)-(7,37)) "helper") [ConApp (Just (7,38)-(7,57)) "::" (Just (Tuple (Just (7,39)-(7,56)) [Bop (Just (7,39)-(7,49)) Mod (Var (Just (7,40)-(7,41)) "v") (Lit (Just (7,46)-(7,48)) (LI 10)),Var (Just (7,53)-(7,56)) "acc"])) Nothing,Bop (Just (7,58)-(7,66)) Div (Var (Just (7,59)-(7,60)) "v") (Lit (Just (7,63)-(7,65)) (LI 10))]
*)

(* typed spans
(7,31)-(7,66)
*)

(* correct types
int list
*)

(* bad types
'a list
*)
