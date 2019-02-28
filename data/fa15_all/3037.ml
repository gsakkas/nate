
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  (((clone 0 ((List.length l2) - (List.length l1))) @ l1),
    ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (num1,num2) = x in
      let (carry,sum) = a in
      ((((num1 + num2) + carry) / 10), ((((num1 + num2) + carry) mod 10) ::
        sum)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (c,res) = List.fold_left f base args in c :: res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i <= 0 then [] else bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x = bigAdd [a :: 0] [mulByDigit x l1] in
  let base = 0 in let args = l2 in List.fold_left f base args;;


(* fix

let bigMul l1 l2 =
  let f a x = a @ [0] in
  let base = [] in let args = l2 in List.fold_left f base args;;

*)

(* changed spans
(11,11)-(21,34)
let f =
  fun a -> fun x -> a @ [0] in
let base = [] in
let args = l2 in
List.fold_left f base args
LetG NonRec (fromList [LamG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Let (Just (3,2)-(4,62)) NonRec [(VarPat (Just (3,6)-(3,7)) "f",Lam (Just (3,8)-(3,21)) (VarPat (Just (3,8)-(3,9)) "a") (Lam (Just (3,10)-(3,21)) (VarPat (Just (3,10)-(3,11)) "x") (App (Just (3,14)-(3,21)) (Var (Just (3,16)-(3,17)) "@") [Var (Just (3,14)-(3,15)) "a",List (Just (3,18)-(3,21)) [Lit (Just (3,19)-(3,20)) (LI 0)] Nothing]) Nothing) Nothing)] (Let (Just (4,2)-(4,62)) NonRec [(VarPat (Just (4,6)-(4,10)) "base",List (Just (4,13)-(4,15)) [] Nothing)] (Let (Just (4,19)-(4,62)) NonRec [(VarPat (Just (4,23)-(4,27)) "args",Var (Just (4,30)-(4,32)) "l2")] (App (Just (4,36)-(4,62)) (Var (Just (4,36)-(4,50)) "List.fold_left") [Var (Just (4,51)-(4,52)) "f",Var (Just (4,53)-(4,57)) "base",Var (Just (4,58)-(4,62)) "args"])))
*)

(* typed spans
(3,2)-(4,62)
*)

(* correct types
int list
*)

(* bad types
int list -> int list -> int list
*)
