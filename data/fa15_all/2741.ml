
let rec clone x n = if n > 0 then [x] @ (clone x (n - 1)) else [];;

let rec addHelper (t,u) =
  match List.rev t with
  | [] -> []
  | h::t ->
      (match List.rev u with
       | [] -> []
       | h'::t' ->
           if (h + h') > 10
           then (addHelper (t, t')) @ [(1 + h') + h]
           else (addHelper (t, t')) @ [h' + h]);;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = addHelper (a, x) in
    let base = 0 in
    let args = List.combine l1 l2 in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then [x] @ (clone x (n - 1)) else [];;

let carry y = y / 10;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let remain x = x mod 10;;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (x1,x2) ->
          (match a with
           | (car,cur) ->
               (match cur with
                | [] ->
                    if ((car + x1) + x2) > 10
                    then
                      ((car + 1), ([car + 1] @ [((remain car) + x1) + x2]))
                    else (0, ([car] @ [(car + x1) + x2]))
                | h::t ->
                    if ((x1 + x2) + h) < 10
                    then (0, ([0] @ ([(x1 + x2) + h] @ t)))
                    else
                      ((car + 1),
                        ([((carry h) + x1) + x2] @
                           ([((remain h) + x1) + x2] @ t))))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(4,19)-(13,47)
EMPTY
EmptyG

(5,2)-(13,47)
EMPTY
EmptyG

(5,8)-(5,16)
EMPTY
EmptyG

(5,8)-(5,18)
EMPTY
EmptyG

(5,17)-(5,18)
EMPTY
EmptyG

(6,10)-(6,12)
EMPTY
EmptyG

(8,6)-(13,47)
EMPTY
EmptyG

(8,13)-(8,21)
EMPTY
EmptyG

(8,13)-(8,23)
EMPTY
EmptyG

(8,22)-(8,23)
EMPTY
EmptyG

(9,15)-(9,17)
EMPTY
EmptyG

(11,11)-(13,46)
EMPTY
EmptyG

(11,14)-(11,22)
EMPTY
EmptyG

(11,14)-(11,27)
EMPTY
EmptyG

(11,15)-(11,16)
EMPTY
EmptyG

(11,19)-(11,21)
fun y -> y / 10
LamG (BopG EmptyG EmptyG)

(11,25)-(11,27)
y / 10
BopG VarG LitG

(12,16)-(12,35)
EMPTY
EmptyG

(12,16)-(12,52)
EMPTY
EmptyG

(12,17)-(12,26)
EMPTY
EmptyG

(12,27)-(12,34)
EMPTY
EmptyG

(12,28)-(12,29)
EMPTY
EmptyG

(12,31)-(12,33)
EMPTY
EmptyG

(12,36)-(12,37)
EMPTY
EmptyG

(12,38)-(12,52)
EMPTY
EmptyG

(12,39)-(12,47)
EMPTY
EmptyG

(12,39)-(12,51)
EMPTY
EmptyG

(12,40)-(12,41)
EMPTY
EmptyG

(12,44)-(12,46)
EMPTY
EmptyG

(12,50)-(12,51)
EMPTY
EmptyG

(13,16)-(13,35)
EMPTY
EmptyG

(13,16)-(13,46)
EMPTY
EmptyG

(13,17)-(13,26)
EMPTY
EmptyG

(13,27)-(13,34)
EMPTY
EmptyG

(13,28)-(13,29)
EMPTY
EmptyG

(13,31)-(13,33)
EMPTY
EmptyG

(13,36)-(13,37)
EMPTY
EmptyG

(13,38)-(13,46)
EMPTY
EmptyG

(13,39)-(13,41)
EMPTY
EmptyG

(13,39)-(13,45)
EMPTY
EmptyG

(13,44)-(13,45)
EMPTY
EmptyG

(22,19)-(23,69)
fun x -> x mod 10
LamG (BopG EmptyG EmptyG)

(27,16)-(27,25)
remain
VarG

(27,16)-(27,32)
match x with
| (x1 , x2) -> match a with
               | (car , cur) -> match cur with
                                | [] -> if ((car + x1) + x2) > 10
                                        then (car + 1 , [car + 1] @ [(remain car + x1) + x2])
                                        else (0 , [car] @ [(car + x1) + x2])
                                | h :: t -> if ((x1 + x2) + h) < 10
                                            then (0 , [0] @ ([(x1 + x2) + h] @ t))
                                            else (car + 1 , [(carry h + x1) + x2] @ ([(remain h + x1) + x2] @ t))
CaseG VarG (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)]))])

(27,26)-(27,32)
x2
VarG

(27,27)-(27,28)
EMPTY
EmptyG

(27,30)-(27,31)
0
LitG

(28,4)-(29,63)
if ((x1 + x2) + h) < 10
then (0 , [0] @ ([(x1 + x2) + h] @ t))
else (car + 1 , [(carry h + x1) + x2] @ ([(remain h + x1) + x2] @ t))
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(28,15)-(28,16)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(29,4)-(29,63)
[]
ListG EmptyG Nothing

(29,15)-(29,33)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(29,37)-(29,63)
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) VarG

(30,2)-(30,34)
res
VarG

*)
