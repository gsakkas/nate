LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))
fun l ->
  match l with
  | x :: [] -> []
  | hd :: tl -> hd :: (removeLast tl)
  | [] -> []
fun l ->
  match l with
  | [] -> []
  | h :: t -> append (listReverse t)
                     [h]
fun xs ->
  match xs with
  | [] -> 0
  | xs -> List.hd xs + sumList (List.tl xs)
fun n ->
  match n with
  | 0 -> []
  | n -> if n < 0
         then []
         else (n mod 10) :: (digitsOfInt (n / 10))
function | y -> y
fun l ->
  match l with
  | [] -> []
  | h :: t -> if h = 0
              then removeZero t
              else l
fun n ->
  match n with
  | 0 -> 0
  | 1 -> 10
  | _ -> 10 * mulByTen (n - 1)
fun b ->
  match b with
  | [] -> [a]
  | hd :: tl -> [a + hd]
fun (x , y) ->
  match x with
  | [] -> y
  | h :: t -> reverse (t , h :: y)
fun l ->
  match l with
  | [] -> []
  | h :: t -> reverse (l , [])
fun xs ->
  match xs with
  | [] -> 0
  | h :: t -> h + sumList t
function | g -> g
function | x -> x
fun l ->
  match l with
  | [] -> []
  | hd :: tl -> helper (hd :: xs)
                       l
fun list ->
  match list with
  | [] -> 0
  | head :: tail -> head
fun xs ->
  match xs with
  | [] -> 0
  | h :: t -> h + sumList t
  | _ -> (-1)
