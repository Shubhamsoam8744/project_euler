ptr n m = (m*m-n*n, 2*n*m, n*n+m*m)
sum (x,y,z) = x+y+z
prod (x,y,z) = x*y*z
main = do
  putStrLn $ take 1 $ dropWhile (\(x,y) -> x /= 1000) ptrSumProd
    where ptrSumProd = [(sum (ptr m n), prod (ptr m n)) | m<-[1..20], n<-[m+1..20]]
