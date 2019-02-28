
let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec additivePersistence n =
  match digitsOfInt n with | [] -> 0 | h::t -> h + t;;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let rec additivePersistence n =
  match digitsOfInt n with | [] -> 0 | _ -> sumList (digitsOfInt n);;

*)

(* changed spans
(7,28)-(8,52)
fun xs ->
  match xs with
  | [] -> 0
  | h :: t -> h + sumList t
  | _ -> (-1)
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(8,2)-(8,52)
match digitsOfInt n with
| [] -> 0
| _ -> sumList (digitsOfInt n)
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,LitG)])

*)

(* changed exprs
Lam (Just (7,16)-(8,63)) (VarPat (Just (7,16)-(7,18)) "xs") (Case (Just (8,2)-(8,63)) (Var (Just (8,8)-(8,10)) "xs") [(ConPat (Just (8,18)-(8,20)) "[]" Nothing,Nothing,Lit (Just (8,24)-(8,25)) (LI 0)),(ConsPat (Just (8,28)-(8,32)) (VarPat (Just (8,28)-(8,29)) "h") (VarPat (Just (8,31)-(8,32)) "t"),Nothing,Bop (Just (8,36)-(8,51)) Plus (Var (Just (8,36)-(8,37)) "h") (App (Just (8,40)-(8,51)) (Var (Just (8,41)-(8,48)) "sumList") [Var (Just (8,49)-(8,50)) "t"])),(WildPat (Just (8,54)-(8,55)),Nothing,Lit (Just (8,59)-(8,63)) (LI (-1)))]) Nothing
Case (Just (11,2)-(11,67)) (App (Just (11,8)-(11,21)) (Var (Just (11,8)-(11,19)) "digitsOfInt") [Var (Just (11,20)-(11,21)) "n"]) [(ConPat (Just (11,29)-(11,31)) "[]" Nothing,Nothing,Lit (Just (11,35)-(11,36)) (LI 0)),(WildPat (Just (11,39)-(11,40)),Nothing,App (Just (11,44)-(11,67)) (Var (Just (11,44)-(11,51)) "sumList") [App (Just (11,52)-(11,67)) (Var (Just (11,53)-(11,64)) "digitsOfInt") [Var (Just (11,65)-(11,66)) "n"]])]
*)

(* typed spans
(7,16)-(8,63)
(11,2)-(11,67)
*)

(* correct types
int list -> int
int
*)

(* bad types
int -> int
int
*)
