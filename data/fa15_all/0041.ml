
let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let rec mulByDigit i l =
  let rec helper acc cin l' =
    match l' with
    | [] -> cin :: acc
    | h::t ->
        let sum = (i * h) + cin in helper ((sum mod 10) :: acc) (sum / 10) t in
  removeZero (helper [] 0 l);;

let bigMul l1 l2 =
  let f a x = mulByDigit x l1 in
  let base = (0, []) in
  let args = l2 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let rec mulByDigit i l =
  let rec helper acc cin l' =
    match l' with
    | [] -> cin :: acc
    | h::t ->
        let sum = (i * h) + cin in helper ((sum mod 10) :: acc) (sum / 10) t in
  removeZero (helper [] 0 l);;

let bigMul l1 l2 =
  let f a x = (0, (mulByDigit x l1)) in
  let base = (0, []) in
  let args = l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(14,14)-(14,29)
(0 , mulByDigit x l1)
TupleG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
Tuple (Just (14,14)-(14,36)) [Lit (Just (14,15)-(14,16)) (LI 0),App (Just (14,18)-(14,35)) (Var (Just (14,19)-(14,29)) "mulByDigit") [Var (Just (14,30)-(14,31)) "x",Var (Just (14,32)-(14,34)) "l1"]]
*)

(* typed spans
(14,14)-(14,36)
*)

(* correct types
(int * int list)
*)

(* bad types
int list
*)
