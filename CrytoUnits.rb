class CryptoUnits 

     # setter and getter 
     attr_accessor :transNum

     def initialize(transNum)
          @transNum = transNum
     end

     # function that generated random transactions
     def transactions
          # new array that stores the random transations
          allRandomTrans = []
          
          # generated transaction
          @transNum.times{allRandomTrans << rand(1000.0)}
          
          # divided the transactions in half
           firstHalf = []

          half = @transNum/2 
          (0...half).each {|ele|firstHalf << allRandomTrans[ele]}

          # now creating the second half
          secondHalf = []
          (half..allRandomTrans.length-1).each{|ele|secondHalf << allRandomTrans[ele]}

          # returning out both both values 
          return [firstHalf, secondHalf]
     end

     # finding a changing interest rate
     def interstRate 
          # easy variables to use
          firstTrans = self.transactions[0].sum
          secondTrans = self.transactions[1].sum

          # finding which set of transactions are greater
          if firstTrans > secondTrans
               # subtract the smaller trans
               diff = firstTrans - secondTrans

               # return the interest rate needed to return to zero
               return (diff * 1.0)/firstTrans
          elsif firstTrans < secondTrans 
               # subtract the smaller trans
               diff = secondTrans - firstTrans

               # return the interest rate needed to return to zero
               return (diff * 1.0)/secondTrans
          else
               return 0
          end
     end
     
end

user = CryptoUnits.new(1000000)
p user.interstRate

# demand is based soley on dollar amount 
# testing the law of averages to see if interest rate is zero
newArr = []
500.times{newArr << user.interstRate}
p newArr

def average(arr)
     (arr.sum * 1.0)/arr.length
end
p average(newArr)