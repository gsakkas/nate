
let rec mulByDigit i l =
  let f a x =
    let (carry,acc) = a in
    let res = (x * i) + carry in ((res / 10), ((res mod 10) :: acc)) in
  let base = (0, []) in let args = List.rev in List.fold_left f base args;;


(* fix

let rec mulByDigit i l =
  let f a x =
    let (carry,acc) = a in
    let res = (x * i) + carry in ((res / 10), ((res mod 10) :: acc)) in
  let base = (0, []) in
  let args = List.rev (0 :: l) in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(6,35)-(6,43)
List.rev (0 :: l)
AppG (fromList [ConAppG (Just (TupleG (fromList [VarG,LitG])))])

(6,47)-(6,73)
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) VarG

*)

(* changed exprs
App (Just (7,13)-(7,30)) (Var (Just (7,13)-(7,21)) "List.rev") [ConApp (Just (7,22)-(7,30)) "::" (Just (Tuple (Just (7,23)-(7,29)) [Lit (Just (7,23)-(7,24)) (LI 0),Var (Just (7,28)-(7,29)) "l"])) Nothing]
Let (Just (8,2)-(8,49)) NonRec [(TuplePat (Just (8,7)-(8,12)) [WildPat (Just (8,7)-(8,8)),VarPat (Just (8,9)-(8,12)) "res"],App (Just (8,16)-(8,42)) (Var (Just (8,16)-(8,30)) "List.fold_left") [Var (Just (8,31)-(8,32)) "f",Var (Just (8,33)-(8,37)) "base",Var (Just (8,38)-(8,42)) "args"])] (Var (Just (8,46)-(8,49)) "res")
*)

(* typed spans
(7,13)-(7,30)
(8,2)-(8,49)
*)

(* correct types
int list
int list
*)

(* bad types
'a list -> 'a list
'a
*)
