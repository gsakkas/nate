
let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

let padZero l1 l2 =
  match (List.length l1) > (List.length l2) with
  | true  -> (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  | false  -> (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  let rec removeZH templ =
    match templ with
    | [] -> []
    | hd::tl -> if hd = 0 then removeZH tl else hd :: tl in
  removeZH l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = () in
    let base = ([], []) in
    let args = f l1 l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

let padZero l1 l2 =
  match (List.length l1) > (List.length l2) with
  | true  -> (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  | false  -> (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  let rec removeZH templ =
    match templ with
    | [] -> []
    | hd::tl -> if hd = 0 then removeZH tl else hd :: tl in
  removeZH l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (x,y) -> x in
      match x with
      | (addend_a,addend_b) ->
          let new_carry = ((carry + addend_a) + addend_b) / 10 in
          let digit = ((carry + addend_a) + addend_b) mod 10 in
          (match a with | (x,y) -> (new_carry, (digit :: y))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,16)-(23,18)
let carry =
  match a with
  | (x , y) -> x in
match x with
| (addend_a , addend_b) -> (let new_carry =
                              ((carry + addend_a) + addend_b) / 10 in
                            let digit =
                              ((carry + addend_a) + addend_b) mod 10 in
                            match a with
                            | (x , y) -> (new_carry , digit :: y))
LetG NonRec (fromList [CaseG EmptyG (fromList [(Nothing,EmptyG)])]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(24,16)-(24,18)
0
LitG

(25,15)-(25,22)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(25,15)-(25,16)
List.combine
VarG

*)

(* changed exprs
Let (Just (24,6)-(29,61)) NonRec [(VarPat (Just (24,10)-(24,15)) "carry",Case (Just (24,18)-(24,43)) (Var (Just (24,24)-(24,25)) "a") [(TuplePat (Just (24,34)-(24,37)) [VarPat (Just (24,34)-(24,35)) "x",VarPat (Just (24,36)-(24,37)) "y"],Nothing,Var (Just (24,42)-(24,43)) "x")])] (Case (Just (25,6)-(29,61)) (Var (Just (25,12)-(25,13)) "x") [(TuplePat (Just (26,9)-(26,26)) [VarPat (Just (26,9)-(26,17)) "addend_a",VarPat (Just (26,18)-(26,26)) "addend_b"],Nothing,Let (Just (27,10)-(29,61)) NonRec [(VarPat (Just (27,14)-(27,23)) "new_carry",Bop (Just (27,26)-(27,62)) Div (Bop (Just (27,26)-(27,57)) Plus (Bop (Just (27,27)-(27,45)) Plus (Var (Just (27,28)-(27,33)) "carry") (Var (Just (27,36)-(27,44)) "addend_a")) (Var (Just (27,48)-(27,56)) "addend_b")) (Lit (Just (27,60)-(27,62)) (LI 10)))] (Let (Just (28,10)-(29,61)) NonRec [(VarPat (Just (28,14)-(28,19)) "digit",Bop (Just (28,22)-(28,60)) Mod (Bop (Just (28,22)-(28,53)) Plus (Bop (Just (28,23)-(28,41)) Plus (Var (Just (28,24)-(28,29)) "carry") (Var (Just (28,32)-(28,40)) "addend_a")) (Var (Just (28,44)-(28,52)) "addend_b")) (Lit (Just (28,58)-(28,60)) (LI 10)))] (Case (Just (29,10)-(29,61)) (Var (Just (29,17)-(29,18)) "a") [(TuplePat (Just (29,27)-(29,30)) [VarPat (Just (29,27)-(29,28)) "x",VarPat (Just (29,29)-(29,30)) "y"],Nothing,Tuple (Just (29,35)-(29,60)) [Var (Just (29,36)-(29,45)) "new_carry",ConApp (Just (29,47)-(29,59)) "::" (Just (Tuple (Just (29,48)-(29,58)) [Var (Just (29,48)-(29,53)) "digit",Var (Just (29,57)-(29,58)) "y"])) Nothing])])))])
Lit (Just (30,16)-(30,17)) (LI 0)
App (Just (31,15)-(31,44)) (Var (Just (31,15)-(31,23)) "List.rev") [App (Just (31,24)-(31,44)) (Var (Just (31,25)-(31,37)) "List.combine") [Var (Just (31,38)-(31,40)) "l1",Var (Just (31,41)-(31,43)) "l2"]]
Var (Just (31,25)-(31,37)) "List.combine"
*)

(* typed spans
(24,6)-(29,61)
(30,16)-(30,17)
(31,15)-(31,44)
(31,25)-(31,37)
*)

(* correct types
(int * int list)
int
(int * int) list
int list -> int list -> (int * int) list
*)

(* bad types
unit
'a list
unit
unit -> 'a -> unit
*)
