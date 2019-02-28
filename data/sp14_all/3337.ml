
let rec mulByDigit i l =
  match List.rev l with
  | [] -> false
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h1::t1 -> let rec helper acc v = [v] = [0] in helper [] h1);;


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

(6,6)-(10,68)
[]
ListG EmptyG

(6,6)-(10,68)
let rec helper =
  fun acc ->
    fun v ->
      if v = 0
      then acc
      else helper ((v mod 10) :: acc)
                  (v / 10) in
helper [] h
LetG Rec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(6,6)-(10,68)
fun acc ->
  fun v ->
    if v = 0
    then acc
    else helper ((v mod 10) :: acc)
                (v / 10)
LamG (LamG EmptyG)

(6,6)-(10,68)
fun v ->
  if v = 0
  then acc
  else helper ((v mod 10) :: acc)
              (v / 10)
LamG (IteG EmptyG EmptyG EmptyG)

(6,6)-(10,68)
if v = 0
then acc
else helper ((v mod 10) :: acc)
            (v / 10)
IteG (BopG EmptyG EmptyG) VarG (AppG (fromList [EmptyG]))

(10,62)-(10,64)
helper [] h
AppG (fromList [VarG,ListG EmptyG])

(10,65)-(10,67)
h
VarG

*)

(* changed exprs
Var (Just (3,8)-(3,9)) "l"
List (Just (4,10)-(4,12)) [] Nothing
Let (Just (6,6)-(8,17)) Rec [(VarPat (Just (6,14)-(6,20)) "helper",Lam (Just (6,21)-(7,66)) (VarPat (Just (6,21)-(6,24)) "acc") (Lam (Just (6,25)-(7,66)) (VarPat (Just (6,25)-(6,26)) "v") (Ite (Just (7,8)-(7,66)) (Bop (Just (7,11)-(7,16)) Eq (Var (Just (7,11)-(7,12)) "v") (Lit (Just (7,15)-(7,16)) (LI 0))) (Var (Just (7,22)-(7,25)) "acc") (App (Just (7,31)-(7,66)) (Var (Just (7,31)-(7,37)) "helper") [ConApp (Just (7,38)-(7,57)) "::" (Just (Tuple (Just (7,39)-(7,56)) [Bop (Just (7,39)-(7,49)) Mod (Var (Just (7,40)-(7,41)) "v") (Lit (Just (7,46)-(7,48)) (LI 10)),Var (Just (7,53)-(7,56)) "acc"])) Nothing,Bop (Just (7,58)-(7,66)) Div (Var (Just (7,59)-(7,60)) "v") (Lit (Just (7,63)-(7,65)) (LI 10))])) Nothing) Nothing)] (App (Just (8,6)-(8,17)) (Var (Just (8,6)-(8,12)) "helper") [List (Just (8,13)-(8,15)) [] Nothing,Var (Just (8,16)-(8,17)) "h"])
Lam (Just (6,21)-(7,66)) (VarPat (Just (6,21)-(6,24)) "acc") (Lam (Just (6,25)-(7,66)) (VarPat (Just (6,25)-(6,26)) "v") (Ite (Just (7,8)-(7,66)) (Bop (Just (7,11)-(7,16)) Eq (Var (Just (7,11)-(7,12)) "v") (Lit (Just (7,15)-(7,16)) (LI 0))) (Var (Just (7,22)-(7,25)) "acc") (App (Just (7,31)-(7,66)) (Var (Just (7,31)-(7,37)) "helper") [ConApp (Just (7,38)-(7,57)) "::" (Just (Tuple (Just (7,39)-(7,56)) [Bop (Just (7,39)-(7,49)) Mod (Var (Just (7,40)-(7,41)) "v") (Lit (Just (7,46)-(7,48)) (LI 10)),Var (Just (7,53)-(7,56)) "acc"])) Nothing,Bop (Just (7,58)-(7,66)) Div (Var (Just (7,59)-(7,60)) "v") (Lit (Just (7,63)-(7,65)) (LI 10))])) Nothing) Nothing
Lam (Just (6,25)-(7,66)) (VarPat (Just (6,25)-(6,26)) "v") (Ite (Just (7,8)-(7,66)) (Bop (Just (7,11)-(7,16)) Eq (Var (Just (7,11)-(7,12)) "v") (Lit (Just (7,15)-(7,16)) (LI 0))) (Var (Just (7,22)-(7,25)) "acc") (App (Just (7,31)-(7,66)) (Var (Just (7,31)-(7,37)) "helper") [ConApp (Just (7,38)-(7,57)) "::" (Just (Tuple (Just (7,39)-(7,56)) [Bop (Just (7,39)-(7,49)) Mod (Var (Just (7,40)-(7,41)) "v") (Lit (Just (7,46)-(7,48)) (LI 10)),Var (Just (7,53)-(7,56)) "acc"])) Nothing,Bop (Just (7,58)-(7,66)) Div (Var (Just (7,59)-(7,60)) "v") (Lit (Just (7,63)-(7,65)) (LI 10))])) Nothing
Ite (Just (7,8)-(7,66)) (Bop (Just (7,11)-(7,16)) Eq (Var (Just (7,11)-(7,12)) "v") (Lit (Just (7,15)-(7,16)) (LI 0))) (Var (Just (7,22)-(7,25)) "acc") (App (Just (7,31)-(7,66)) (Var (Just (7,31)-(7,37)) "helper") [ConApp (Just (7,38)-(7,57)) "::" (Just (Tuple (Just (7,39)-(7,56)) [Bop (Just (7,39)-(7,49)) Mod (Var (Just (7,40)-(7,41)) "v") (Lit (Just (7,46)-(7,48)) (LI 10)),Var (Just (7,53)-(7,56)) "acc"])) Nothing,Bop (Just (7,58)-(7,66)) Div (Var (Just (7,59)-(7,60)) "v") (Lit (Just (7,63)-(7,65)) (LI 10))])
App (Just (8,6)-(8,17)) (Var (Just (8,6)-(8,12)) "helper") [List (Just (8,13)-(8,15)) [] Nothing,Var (Just (8,16)-(8,17)) "h"]
Var (Just (8,16)-(8,17)) "h"
*)

(* typed spans
(3,8)-(3,9)
(4,10)-(4,12)
(6,6)-(8,17)
(6,21)-(7,66)
(6,25)-(7,66)
(7,8)-(7,66)
(8,6)-(8,17)
(8,16)-(8,17)
*)

(* correct types
int list
int list
int list
int list -> int -> int list
int -> int list
int list
int list
int
*)

(* bad types
int list
'a list
'a list
'a list
'a list
'a list
'a list
int
*)
