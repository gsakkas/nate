
let rec helper l1 l2 =
  match l1 with | [] -> [] | h::t -> (h, l2) :: (helper t l2);;

let bigMul l1 l2 =
  let f a x = let (x1,x2) = x in let (carry,res) = a in carry @ res in
  let base = [] in
  let args = List.rev (helper l1 l2) in
  let (carry,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in [carry] @ res in
  removeZero (add (padZero l1 l2));;

let rec helper l1 l2 =
  match l1 with | [] -> [] | h::t -> (h, l2) :: (helper t l2);;

let rec mulByDigit i l =
  let f a x =
    let carry = i * x in
    match a with
    | h::t -> ((h + carry) / 10) :: ((h + carry) mod 10) :: t
    | _ -> [carry / 10; carry mod 10] in
  let base = [] in removeZero (List.fold_left f base (List.rev l));;

let bigMul l1 l2 =
  let f a x =
    let (x1,x2) = x in
    let (carry,res) = a in
    ((carry @ [0]), (bigAdd ((mulByDigit x1 x2) @ carry) res)) in
  let base = ([], []) in
  let args = List.rev (helper l1 l2) in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(2,15)-(3,61)
fun x ->
  fun n ->
    if n <= 0
    then []
    else x :: (clone x (n - 1))
LamG (LamG EmptyG)

(3,2)-(3,61)
if List.length l1 > List.length l2
then (l1 , clone 0
                 (List.length l1 - List.length l2) @ l2)
else if List.length l1 < List.length l2
     then (clone 0
                 (List.length l2 - List.length l1) @ l1 , l2)
     else (l1 , l2)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (IteG EmptyG EmptyG EmptyG)

(3,8)-(3,10)
fun l1 ->
  fun l2 ->
    (let add =
       fun (l1 , l2) ->
         (let f =
            fun a ->
              fun x ->
                (let (x1 , x2) = x in
                 let (carry , res) = a in
                 (((x1 + x2) + carry) / 10 , (((x1 + x2) + carry) mod 10) :: res)) in
          let base = (0 , []) in
          let args =
            List.rev (List.combine l1
                                   l2) in
          let (carry , res) =
            List.fold_left f base args in
          [carry] @ res) in
     removeZero (add (padZero l1
                              l2)))
LamG (LamG EmptyG)

(3,24)-(3,26)
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> []
    | h :: t -> (h , l2) :: (helper t
                                    l2)
LamG (LamG EmptyG)

(5,11)-(9,53)
fun i ->
  fun l ->
    (let f =
       fun a ->
         fun x ->
           (let carry = i * x in
            match a with
            | h :: t -> ((h + carry) / 10) :: (((h + carry) mod 10) :: t)
            | _ -> [carry / 10 ; carry mod 10]) in
     let base = [] in
     removeZero (List.fold_left f
                                base (List.rev l)))
LamG (LamG EmptyG)

(6,56)-(6,67)
(carry @ [0] , bigAdd (mulByDigit x1
                                  x2 @ carry) res)
TupleG (fromList [AppG (fromList [EmptyG])])

(6,64)-(6,67)
bigAdd (mulByDigit x1
                   x2 @ carry) res
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(7,13)-(7,15)
([] , [])
TupleG (fromList [ListG EmptyG])

(8,2)-(9,53)
[]
ListG EmptyG

(9,2)-(9,53)
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) VarG

*)

(* typed spans
int -> int -> int list
(int list * int list)
int list -> int list -> int list
int list -> int list -> (int * int list) list
int -> int list -> int list
(int list * int list)
int list
(int list * int list)
int list
int list
*)
