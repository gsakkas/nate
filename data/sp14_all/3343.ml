
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> ((mulByDigit i (List.rev t)) * 10) + (h * i);;


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

(5,12)-(5,56)
let rec helper =
  fun acc ->
    fun v ->
      if v = 0
      then acc
      else helper ((v mod 10) :: acc)
                  (v / 10) in
helper [] h
LetG Rec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Var (Just (3,8)-(3,9)) "l"
Let (Just (6,6)-(8,17)) Rec [(VarPat (Just (6,14)-(6,20)) "helper",Lam (Just (6,21)-(7,66)) (VarPat (Just (6,21)-(6,24)) "acc") (Lam (Just (6,25)-(7,66)) (VarPat (Just (6,25)-(6,26)) "v") (Ite (Just (7,8)-(7,66)) (Bop (Just (7,11)-(7,16)) Eq (Var (Just (7,11)-(7,12)) "v") (Lit (Just (7,15)-(7,16)) (LI 0))) (Var (Just (7,22)-(7,25)) "acc") (App (Just (7,31)-(7,66)) (Var (Just (7,31)-(7,37)) "helper") [ConApp (Just (7,38)-(7,57)) "::" (Just (Tuple (Just (7,39)-(7,56)) [Bop (Just (7,39)-(7,49)) Mod (Var (Just (7,40)-(7,41)) "v") (Lit (Just (7,46)-(7,48)) (LI 10)),Var (Just (7,53)-(7,56)) "acc"])) Nothing,Bop (Just (7,58)-(7,66)) Div (Var (Just (7,59)-(7,60)) "v") (Lit (Just (7,63)-(7,65)) (LI 10))])) Nothing) Nothing)] (App (Just (8,6)-(8,17)) (Var (Just (8,6)-(8,12)) "helper") [List (Just (8,13)-(8,15)) [] Nothing,Var (Just (8,16)-(8,17)) "h"])
*)

(* typed spans
(3,8)-(3,9)
(6,6)-(8,17)
*)

(* correct types
int list
int list
*)

(* bad types
int list
int
*)
