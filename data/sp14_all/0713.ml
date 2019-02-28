
let rec digitsOfInt n =
  if ((n mod 2) = 0) && (n > 0)
  then
    let rec loop input =
      if input < 10 then input else [loop (input / 10); input mod 10] in
    loop n
  else [];;


(* fix

let rec digitsOfInt n =
  if ((n mod 2) = 0) && (n > 0)
  then
    let rec loop input =
      if input < 10
      then [input]
      else (let y::[] = loop (input / 10) in [y; input mod 10]) in
    loop n
  else [];;

*)

(* changed spans
(6,25)-(6,30)
[input]
ListG VarG

(6,36)-(6,69)
let y :: [] =
  loop (input / 10) in
[y ; input mod 10]
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (ListG EmptyG)

*)

(* changed exprs
List (Just (7,11)-(7,18)) [Var (Just (7,12)-(7,17)) "input"] Nothing
Let (Just (8,11)-(8,63)) NonRec [(ConsPat (Just (8,16)-(8,21)) (VarPat (Just (8,16)-(8,17)) "y") (ConPat (Just (8,19)-(8,21)) "[]" Nothing),App (Just (8,24)-(8,41)) (Var (Just (8,24)-(8,28)) "loop") [Bop (Just (8,29)-(8,41)) Div (Var (Just (8,30)-(8,35)) "input") (Lit (Just (8,38)-(8,40)) (LI 10))])] (List (Just (8,45)-(8,62)) [Var (Just (8,46)-(8,47)) "y",Bop (Just (8,49)-(8,61)) Mod (Var (Just (8,49)-(8,54)) "input") (Lit (Just (8,59)-(8,61)) (LI 10))] Nothing)
*)

(* typed spans
(7,11)-(7,18)
(8,11)-(8,63)
*)

(* correct types
int list
int list
*)

(* bad types
int
int list
*)
