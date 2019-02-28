
let rec mulByDigit i l =
  match l with
  | [] -> [0]
  | h::t ->
      let (cin,res) = mulByDigit i t in
      let sum = (i * h) + cin in ((sum / 10), ((sum mod 10) :: res));;


(* fix

let rec mulByDigit i l =
  let rec helper acc cin =
    match l with
    | [] -> cin :: acc
    | h::t ->
        let sum = (i * h) + cin in helper ((sum mod 10) :: acc) (sum / 10) in
  helper [] 0;;

*)

(* changed spans
(3,2)-(7,68)
let rec helper =
  fun acc ->
    fun cin ->
      match l with
      | [] -> cin :: acc
      | h :: t -> (let sum =
                     (i * h) + cin in
                   helper ((sum mod 10) :: acc)
                          (sum / 10)) in
helper [] 0
LetG Rec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (3,2)-(8,13)) Rec [(VarPat (Just (3,10)-(3,16)) "helper",Lam (Just (3,17)-(7,74)) (VarPat (Just (3,17)-(3,20)) "acc") (Lam (Just (3,21)-(7,74)) (VarPat (Just (3,21)-(3,24)) "cin") (Case (Just (4,4)-(7,74)) (Var (Just (4,10)-(4,11)) "l") [(ConPat (Just (5,6)-(5,8)) "[]" Nothing,Nothing,ConApp (Just (5,12)-(5,22)) "::" (Just (Tuple (Just (5,12)-(5,22)) [Var (Just (5,12)-(5,15)) "cin",Var (Just (5,19)-(5,22)) "acc"])) Nothing),(ConsPat (Just (6,6)-(6,10)) (VarPat (Just (6,6)-(6,7)) "h") (VarPat (Just (6,9)-(6,10)) "t"),Nothing,Let (Just (7,8)-(7,74)) NonRec [(VarPat (Just (7,12)-(7,15)) "sum",Bop (Just (7,18)-(7,31)) Plus (Bop (Just (7,18)-(7,25)) Times (Var (Just (7,19)-(7,20)) "i") (Var (Just (7,23)-(7,24)) "h")) (Var (Just (7,28)-(7,31)) "cin"))] (App (Just (7,35)-(7,74)) (Var (Just (7,35)-(7,41)) "helper") [ConApp (Just (7,42)-(7,63)) "::" (Just (Tuple (Just (7,43)-(7,62)) [Bop (Just (7,43)-(7,55)) Mod (Var (Just (7,44)-(7,47)) "sum") (Lit (Just (7,52)-(7,54)) (LI 10)),Var (Just (7,59)-(7,62)) "acc"])) Nothing,Bop (Just (7,64)-(7,74)) Div (Var (Just (7,65)-(7,68)) "sum") (Lit (Just (7,71)-(7,73)) (LI 10))]))]) Nothing) Nothing)] (App (Just (8,2)-(8,13)) (Var (Just (8,2)-(8,8)) "helper") [List (Just (8,9)-(8,11)) [] Nothing,Lit (Just (8,12)-(8,13)) (LI 0)])
*)

(* typed spans
(3,2)-(8,13)
*)

(* correct types
int list
*)

(* bad types
int list
*)
