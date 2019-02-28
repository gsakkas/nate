LamG (LamG EmptyG)
fun x ->
  fun n ->
    if n <= 0
    then []
    else x :: (clone x (n - 1))
fun r -> fun a -> fun x -> a x
fun a -> fun x -> x a
fun x -> fun a -> x a
fun x ->
  fun n ->
    if x <= 0
    then []
    else cloneHelper x (n - 1)
fun x ->
  fun n ->
    if n < 1
    then []
    else cloneHelper x n []
fun b ->
  fun b ->
    (f b , if f b = b
           then true
           else false)
fun f ->
  fun b ->
    fun b ->
      (f b , if f b = b
             then true
             else false)
fun f ->
  fun l ->
    match l with
    | x :: [] -> "[" ^ (x ^ "]")
fun sep ->
  fun sl ->
    match sl with
    | [] -> ""
    | h :: t -> (let f =
                   fun a ->
                     fun x -> a ^ (sep ^ x) in
                 let base = h in
                 let l = t in
                 List.fold_left f base l)
fun l1 ->
  fun l2 ->
    if List.length l1 < List.length l2
    then clone 0
               (List.length l2 - List.length l1) @ l1
    else clone 0
               (List.length l1 - List.length l2) @ l2
fun l1 ->
  fun l2 ->
    (let (x , y) =
       padZero l1 l2 in
     (List.rev x , clone y
                         (List.length y)))
fun i ->
  fun l ->
    if i < 1
    then []
    else bigAdd l
                (mulByDigit (i - 1) l)
fun a ->
  fun x ->
    (let (y , z) = a in
     let (r , s) = x in
     let m = (r + s) + y in
     (m / 10 , (m mod 10) :: z))
fun a -> fun x -> (a * a) + x
fun a -> fun x -> x
fun x ->
  fun n ->
    if n < 1
    then []
    else x :: (clone x (n - 1))
fun i ->
  fun l ->
    if i > 0
    then bigAdd l
                (mulByDigit (i - 1) l)
    else []
fun n ->
  fun x ->
    if n > 0
    then helper (n - 1) (x / 10)
    else []
fun (f , b) ->
  fun b -> (f b , f b = b)
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> []
    | h :: t -> (h , l2) :: (helper t
                                    l2)
fun x ->
  fun n ->
    if n = 0
    then []
    else x :: (clone x (n - 1))
fun x ->
  fun l ->
    if x > 0
    then l @ []
    else appZero (x - 1) l
fun a -> fun x -> a + (x * x)
fun f -> fun x -> x
fun x -> fun a -> a
fun a ->
  fun x -> fun x -> fun a -> a x
fun i ->
  fun l ->
    if i < 1
    then []
    else (match i with
          | 1 -> l
          | 10 -> l @ [0]
          | _ -> bigAdd l
                        (mulByDigit (i - 1) l))
fun l1 ->
  fun l2 ->
    (let f =
       fun a ->
         fun x ->
           (let (c , a') = a in
            let m = mulByDigit x l2 in
            let s = bigAdd m a' in
            (c + 1 , s)) in
     let base = (0 , [0]) in
     let args = l1 in
     let (_ , res) =
       List.fold_left f base args in
     res)
