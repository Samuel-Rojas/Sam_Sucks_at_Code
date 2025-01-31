# Big O(n) runtime for the space complexity

class Solution(object):


    def runningSum(self, nums):
        sums = 0
        result = []
        for i in range(len(nums)):
                sums = sums + nums[i]
                result.append(sums)
                print(result)

        return result


solution = Solution()
test_nums = [1, 2, 3, 4]
print("Input array:", test_nums)
print("Final result:", solution.runningSum(test_nums))


