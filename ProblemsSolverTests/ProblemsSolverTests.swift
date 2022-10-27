//
//  ProblemsSolverTests.swift
//  ProblemsSolverTests
//
//  Created by Kanyan Zheng on 2022/9/17.
//

import XCTest
@testable import ProblemsSolver

class ProblemsSolverTests: XCTestCase {

    func test_getSubString() {
        let sut = "Hello World"
        XCTAssertEqual(sut.subString(from: 0, to: 4), "Hell")
    }
    
    func test_minWindowSubstring() {
        XCTAssertEqual(MinWindowSubstring(["Helloworld", "Hel"]), "Hel")
        XCTAssertEqual(MinWindowSubstring(["Helloworld", "Hld"]), "Helloworld")
        
        XCTAssertEqual(MinWindowSubstring(["ahffaksfajeeubsne", "jefaa"]), "aksfaje")
    }
    
    func test_treeConstructor() {
        XCTAssertEqual(TreeConstructor(["(1,2)", "(2,4)", "(5,7)", "(7,2)", "(9,5)"]), "true")
        XCTAssertEqual(TreeConstructor(["(1,2)", "(3,2)", "(2,12)", "(5,2)"]), "false")
        
        XCTAssertEqual(TreeConstructor(["(1,2)", "(2,4)", "(5,7)", "(7,2)", "(9,5)", "(6,8)"]), "false")
        XCTAssertEqual(TreeConstructor(["(1,2)", "(2,4)", "(5,7)", "(7,2)", "(9,5)", "(9,7)"]), "false")
        XCTAssertEqual(TreeConstructor(["(1,2)", "(2,4)", "(5,7)", "(7,2)", "(9,5)", "(9,1)"]), "false")
    }
    
    func test_bracketMatchers() {
        XCTAssertEqual(BracketMatcher("(coder)(byte))"), "0")
        XCTAssertEqual(BracketMatcher("(c(oder)) b(yte)"), "1")
    }
    
    func test_findDuplicateFilesInSystem() {
        let duplicatePaths1 = FindDuplicateFilesInSystem(["root/a 1.txt(abcd) 2.txt(efgh)","root/c 3.txt(abcd)","root/c/d 4.txt(efgh)","root 4.txt(efgh)"])
        let expectedPaths1 = [["root/a/2.txt","root/c/d/4.txt","root/4.txt"],["root/a/1.txt","root/c/3.txt"]]
        
        XCTAssertEqual(duplicatePaths1.count, expectedPaths1.count)
        duplicatePaths1.forEach { duplicatePath in
            XCTAssertTrue(expectedPaths1.contains(duplicatePath))
        }
        
        let duplicatePaths2 = FindDuplicateFilesInSystem(["root/a 1.txt(abcd) 2.txt(efgh)","root/c 3.txt(abcd)","root/c/d 4.txt(efgh)"])
        let expectedPaths2 = [["root/a/2.txt","root/c/d/4.txt"],["root/a/1.txt","root/c/3.txt"]]
        
        XCTAssertEqual(duplicatePaths2.count, expectedPaths2.count)
        duplicatePaths2.forEach { duplicatePath in
            XCTAssertTrue(expectedPaths2.contains(duplicatePath))
        }
        
        let noDuplicateFilePaths = FindDuplicateFilesInSystem(["root/a 1.txt(abcd) 2.txt(efgh)","root/c 3.txt(abcde)","root/c/d 4.txt(efgho)"])
        XCTAssertEqual(noDuplicateFilePaths, [])
    }
    
    func test_threeSum() {
        XCTAssertEqual(ThreeSum([0, 0, 0]), [[0, 0, 0]])
        XCTAssertEqual(ThreeSum([-1,0,1,2,-1,-4]), [[-1,-1,2],[-1,0,1]])
        XCTAssertEqual(ThreeSum([0,1,1]), [])
    }
    
    func test_fourSum2() {
        XCTAssertEqual(FourSumCount([1,2], [-2,-1], [-1,2], [0,2]), 2)
        XCTAssertEqual(FourSumCount([-1,-1], [-1,1], [-1,1], [1,-1]), 6)
    }
    
    func test_groupAnagrams() {
        let grouped = GroupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"])
        let groupedSet = Set(grouped.map { groupStrs in
            Set(groupStrs)
        })
        let expectedSet = Set([Set(["bat"]), Set(["nat", "tan"]), Set(["ate", "eat", "tea"])])
        XCTAssertEqual(groupedSet, expectedSet)
    }
    
    func test_numberOfBoomerangs() {
        XCTAssertEqual(NumberOfBoomerangs([[0,0],[1,0],[2,0]]), 2)
        XCTAssertEqual(NumberOfBoomerangs([[1,1],[2,2],[3,3]]), 2)
        XCTAssertEqual(NumberOfBoomerangs([[1,1]]), 0)
        XCTAssertEqual(NumberOfBoomerangs([[0,0],[1,0],[-1,0],[0,1],[0,-1]]), 20)
        
        XCTAssertEqual(NumberOfBoomerangs2([[0,0],[1,0],[2,0]]), 2)
        XCTAssertEqual(NumberOfBoomerangs2([[1,1],[2,2],[3,3]]), 2)
        XCTAssertEqual(NumberOfBoomerangs2([[1,1]]), 0)
        XCTAssertEqual(NumberOfBoomerangs2([[0,0],[1,0],[-1,0],[0,1],[0,-1]]), 20)
    }
    
    func test_arrayChallenge() {
        XCTAssertEqual(ArrayChallenge([0, 1, 2, 4, 1, 1, 1]), 0)
        XCTAssertEqual(ArrayChallenge([0, 4, 22, 4, 14, 4, 2]), 1)
        XCTAssertEqual(ArrayChallenge([ 1, 2, 3, 5, 7, 8,10 ]), 1)
        XCTAssertEqual(ArrayChallenge([ 0, 2, 3, 4, 4, 4, 4, 4 ]), 0)
        XCTAssertEqual(ArrayChallenge([ 0, 2, 2, 2, 2, 2, 3, 4, 5, 6 ]), 1)
        XCTAssertEqual(ArrayChallenge([ 0, 2, 2, 2, 2, 2, 3, 4, 5, 6 ]), 1)
    }
    
    func test_maxPoints() {
        XCTAssertEqual(MaxPoints([[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]]), 4)
    }
    
    func test_containsNearByDuplicate() {
        XCTAssertEqual(ContainsNearbyDuplicate([1,2,3,1], 3), true)
        XCTAssertEqual(ContainsNearbyDuplicate([1,0,1,1], 1), true)
        XCTAssertEqual(ContainsNearbyDuplicate([1,2,3,1,2,3], 2), false)
    }
    
    func test_containsNearByAlmostDuplicate() {
        XCTAssertEqual(ContainsNearbyAlmostDuplicate([1,2,3,1], 3, 0), true)
        XCTAssertEqual(ContainsNearbyAlmostDuplicate([1,0,1,1], 1, 2), true)
        XCTAssertEqual(ContainsNearbyAlmostDuplicate([1,5,9,1,5,9], 2, 3), false)
    }
    
    func test_ReversedLinkList() {
        let head1 = ListNode(5)
        XCTAssertEqual(reverseBetween(head1, 1, 1), head1)

        let head2 = ListNode(1)
        head2.next = ListNode(2)
        head2.next?.next = ListNode(3)
        head2.next?.next?.next = ListNode(4)
        head2.next?.next?.next?.next = ListNode(5)
        XCTAssertEqual(reverseBetween(head2, 2, 4)!.toString(), "[1, 4, 3, 2, 5, nil]")
        
        let head3 = ListNode(3)
        head3.next = ListNode(5)
        XCTAssertEqual(reverseBetween(head3, 1, 2)!.toString(), "[5, 3, nil]")
    }
    
    func test_partitionLinks() throws {
        let head1 = try! ListNode([1, 4, 3, 2, 5, 2])
        XCTAssertEqual(PartitionLinks(head1, 3)?.toString(), "[1, 2, 2, 4, 3, 5, nil]")
        
        let head2 = try! ListNode([2, 1])
        XCTAssertEqual(PartitionLinks(head2, 2)?.toString(), "[1, 2, nil]")
    }
    
    // MARK: -- Stack
    func test_parentheses() {
        XCTAssertEqual(IsValid("{}"), true)
        XCTAssertEqual(IsValid("()[]{}"), true)
        XCTAssertEqual(IsValid("(]"), false)
    }
    
    func test_reversePolishNotation() {
        XCTAssertEqual(EvalRPN(["2","1","+","3","*"]), 9)
        XCTAssertEqual(EvalRPN(["4","13","5","/","+"]), 6)
        XCTAssertEqual(EvalRPN(["10","6","9","3","+","-11","*","/","*","17","+","5","+"]), 22)
    }
    
    func test_simplifyPath() {
        XCTAssertEqual(SimplifyPath("/home/"), "/home")
        XCTAssertEqual(SimplifyPath("/home"), "/home")
        XCTAssertEqual(SimplifyPath("/../"), "/")
        XCTAssertEqual(SimplifyPath("/home//foo/"), "/home/foo")
        XCTAssertEqual(SimplifyPath("/a/./b/../../c/"), "/c")
    }
    
    func test_inorderTraversal() {
        let root = TreeNode(1)
        root.right = TreeNode(2)
        root.right?.left = TreeNode(3)
        XCTAssertEqual(InorderTraversal(root), [1, 3, 2])
        XCTAssertEqual(InorderTraversalWithoutRecursion(root), [1, 3, 2])
    }
    
    func test_postorderTraversal() {
        let root = TreeNode(1)
        root.right = TreeNode(2)
        root.right?.left = TreeNode(3)
        XCTAssertEqual(PostorderTraversal(root), [3, 2, 1])
        XCTAssertEqual(PostorderTraversalWithoutRecursion(root), [3, 2, 1])
        XCTAssertEqual(PostorderTraversalWithoutRecursion2(root), [3, 2, 1])
    }
    
    func test_levelOrderTraversal() {
        let root = TreeNode(3)
        root.left = TreeNode(9)
        root.right = TreeNode(20)
        root.right?.left = TreeNode(15)
        root.right?.right = TreeNode(7)
        XCTAssertEqual(LevelOrder(root), [[3],[9,20],[15,7]])
        XCTAssertEqual(LevelOrder2(root), [[3],[9,20],[15,7]])
        
        let root2 = TreeNode(1)
        XCTAssertEqual(LevelOrder(root2), [[1]])
        XCTAssertEqual(LevelOrder2(root2), [[1]])
    }
    
    func test_perfectSquares() {
        XCTAssertEqual(NumSquares(12), 3)
        XCTAssertEqual(NumSquares(13), 2)
    }
    
    func test_wordLadder() {
        XCTAssertEqual(LadderLength("hit", "cog", ["hot","dot","dog","lot","log","cog"]), 5)
        XCTAssertEqual(LadderLength("hit", "cog", ["hot","dot","dog","lot","log"]), 0)
        
        XCTAssertEqual(LadderLength2("hit", "cog", ["hot","dot","dog","lot","log","cog"]), 5)
        XCTAssertEqual(LadderLength2("hit", "cog", ["hot","dot","dog","lot","log"]), 0)
    }
    
    func test_wordLadderII() {
        XCTAssertEqual(Set(FindLadders("hit", "cog", ["hot","dot","dog","lot","log","cog"])), Set([["hit","hot","dot","dog","cog"],["hit","hot","lot","log","cog"]]))
        XCTAssertEqual(FindLadders("hit", "cog", ["hot","dot","dog","lot","log"]), [[String]]())
        
        XCTAssertEqual(FindLadders2("hit", "cog", ["hot","dot","dog","lot","log","cog"]).count, 2)
        XCTAssertEqual(Set(FindLadders2("hit", "cog", ["hot","dot","dog","lot","log","cog"])), Set([["hit","hot","dot","dog","cog"],["hit","hot","lot","log","cog"]]))
        XCTAssertEqual(FindLadders2("hit", "cog", ["hot","dot","dog","lot","log"]), [[String]]())
        
//        XCTAssertEqual(FindLadders2("aaaaa", "ggggg", ["aaaaa","caaaa","cbaaa","daaaa","dbaaa","eaaaa","ebaaa","faaaa","fbaaa","gaaaa","gbaaa","haaaa","hbaaa","iaaaa","ibaaa","jaaaa","jbaaa","kaaaa","kbaaa","laaaa","lbaaa","maaaa","mbaaa","naaaa","nbaaa","oaaaa","obaaa","paaaa","pbaaa","bbaaa","bbcaa","bbcba","bbdaa","bbdba","bbeaa","bbeba","bbfaa","bbfba","bbgaa","bbgba","bbhaa","bbhba","bbiaa","bbiba","bbjaa","bbjba","bbkaa","bbkba","bblaa","bblba","bbmaa","bbmba","bbnaa","bbnba","bboaa","bboba","bbpaa","bbpba","bbbba","abbba","acbba","dbbba","dcbba","ebbba","ecbba","fbbba","fcbba","gbbba","gcbba","hbbba","hcbba","ibbba","icbba","jbbba","jcbba","kbbba","kcbba","lbbba","lcbba","mbbba","mcbba","nbbba","ncbba","obbba","ocbba","pbbba","pcbba","ccbba","ccaba","ccaca","ccdba","ccdca","cceba","cceca","ccfba","ccfca","ccgba","ccgca","cchba","cchca","cciba","ccica","ccjba","ccjca","cckba","cckca","cclba","cclca","ccmba","ccmca","ccnba","ccnca","ccoba","ccoca","ccpba","ccpca","cccca","accca","adcca","bccca","bdcca","eccca","edcca","fccca","fdcca","gccca","gdcca","hccca","hdcca","iccca","idcca","jccca","jdcca","kccca","kdcca","lccca","ldcca","mccca","mdcca","nccca","ndcca","occca","odcca","pccca","pdcca","ddcca","ddaca","ddada","ddbca","ddbda","ddeca","ddeda","ddfca","ddfda","ddgca","ddgda","ddhca","ddhda","ddica","ddida","ddjca","ddjda","ddkca","ddkda","ddlca","ddlda","ddmca","ddmda","ddnca","ddnda","ddoca","ddoda","ddpca","ddpda","dddda","addda","aedda","bddda","bedda","cddda","cedda","fddda","fedda","gddda","gedda","hddda","hedda","iddda","iedda","jddda","jedda","kddda","kedda","lddda","ledda","mddda","medda","nddda","nedda","oddda","oedda","pddda","pedda","eedda","eeada","eeaea","eebda","eebea","eecda","eecea","eefda","eefea","eegda","eegea","eehda","eehea","eeida","eeiea","eejda","eejea","eekda","eekea","eelda","eelea","eemda","eemea","eenda","eenea","eeoda","eeoea","eepda","eepea","eeeea","ggggg","agggg","ahggg","bgggg","bhggg","cgggg","chggg","dgggg","dhggg","egggg","ehggg","fgggg","fhggg","igggg","ihggg","jgggg","jhggg","kgggg","khggg","lgggg","lhggg","mgggg","mhggg","ngggg","nhggg","ogggg","ohggg","pgggg","phggg","hhggg","hhagg","hhahg","hhbgg","hhbhg","hhcgg","hhchg","hhdgg","hhdhg","hhegg","hhehg","hhfgg","hhfhg","hhigg","hhihg","hhjgg","hhjhg","hhkgg","hhkhg","hhlgg","hhlhg","hhmgg","hhmhg","hhngg","hhnhg","hhogg","hhohg","hhpgg","hhphg","hhhhg","ahhhg","aihhg","bhhhg","bihhg","chhhg","cihhg","dhhhg","dihhg","ehhhg","eihhg","fhhhg","fihhg","ghhhg","gihhg","jhhhg","jihhg","khhhg","kihhg","lhhhg","lihhg","mhhhg","mihhg","nhhhg","nihhg","ohhhg","oihhg","phhhg","pihhg","iihhg","iiahg","iiaig","iibhg","iibig","iichg","iicig","iidhg","iidig","iiehg","iieig","iifhg","iifig","iighg","iigig","iijhg","iijig","iikhg","iikig","iilhg","iilig","iimhg","iimig","iinhg","iinig","iiohg","iioig","iiphg","iipig","iiiig","aiiig","ajiig","biiig","bjiig","ciiig","cjiig","diiig","djiig","eiiig","ejiig","fiiig","fjiig","giiig","gjiig","hiiig","hjiig","kiiig","kjiig","liiig","ljiig","miiig","mjiig","niiig","njiig","oiiig","ojiig","piiig","pjiig","jjiig","jjaig","jjajg","jjbig","jjbjg","jjcig","jjcjg","jjdig","jjdjg","jjeig","jjejg","jjfig","jjfjg","jjgig","jjgjg","jjhig","jjhjg","jjkig","jjkjg","jjlig","jjljg","jjmig","jjmjg","jjnig","jjnjg","jjoig","jjojg","jjpig","jjpjg","jjjjg","ajjjg","akjjg","bjjjg","bkjjg","cjjjg","ckjjg","djjjg","dkjjg","ejjjg","ekjjg","fjjjg","fkjjg","gjjjg","gkjjg","hjjjg","hkjjg","ijjjg","ikjjg","ljjjg","lkjjg","mjjjg","mkjjg","njjjg","nkjjg","ojjjg","okjjg","pjjjg","pkjjg","kkjjg","kkajg","kkakg","kkbjg","kkbkg","kkcjg","kkckg","kkdjg","kkdkg","kkejg","kkekg","kkfjg","kkfkg","kkgjg","kkgkg","kkhjg","kkhkg","kkijg","kkikg","kkljg","kklkg","kkmjg","kkmkg","kknjg","kknkg","kkojg","kkokg","kkpjg","kkpkg","kkkkg","ggggx","gggxx","ggxxx","gxxxx","xxxxx","xxxxy","xxxyy","xxyyy","xyyyy","yyyyy","yyyyw","yyyww","yywww","ywwww","wwwww","wwvww","wvvww","vvvww","vvvwz","avvwz","aavwz","aaawz","aaaaz"]), [[String]]())
    }
    
    func test_topKFrequent() {
        XCTAssertEqual(TopKFrequent([1,1,1,2,2,3], 2), [1, 2])
        XCTAssertEqual(TopKFrequent([1], 1), [1])
        
        XCTAssertEqual(TopKFrequentWithHeap([1,1,1,2,2,3], 2), [1, 2])
        XCTAssertEqual(TopKFrequentWithHeap([1], 1), [1])
    }
    
    func test_mergeKSortedLists() {
        let node0 = try! ListNode([1, 4, 5])
        let node1 = try! ListNode([1, 3, 4])
        let node2 = try! ListNode([2, 6])
        print("Merged List: \(mergeKLists([node0, node1, node2])!.toString())")
    }
    
    /// Two Pointers
    func test_fastSort() {
        XCTAssertEqual(QuickSort(nums: [4, 3, 1]), [1, 3, 4])
        XCTAssertEqual(QuickSort(nums: [4, 3, 1, 2, 5, 7, 10, 9, 6, 8]), [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
        XCTAssertEqual(QuickSort(nums: [3, 3, 1]), [1, 3, 3])
    }
    
    func test_findKthLargest() {
        XCTAssertEqual(FindKthLargestWithPartition([3,2,1,5,6,4], 2), 5)
        XCTAssertEqual(FindKthLargestWithPartition([3,2,3,1,2,4,5,5,6], 4), 4)
        XCTAssertEqual(FindKthLargestWithPartition([1], 1), 1)
        XCTAssertEqual(FindKthLargestWithPartition([5,2,4,1,3,6,0], 4), 3)
        XCTAssertEqual(FindKthLargestWithPartition([3,2,3,1,2,4,5,5,6,7,7,8,2,3,1,1,1,10,11,5,6,2,4,7,8,5,6], 20), 2)
        
        XCTAssertEqual(FindKthLargestWithHeap([3,2,1,5,6,4], 2), 5)
        XCTAssertEqual(FindKthLargestWithHeap([3,2,3,1,2,4,5,5,6], 4), 4)
        XCTAssertEqual(FindKthLargestWithHeap([1], 1), 1)
        XCTAssertEqual(FindKthLargestWithHeap([5,2,4,1,3,6,0], 4), 3)
        XCTAssertEqual(FindKthLargestWithHeap([3,2,3,1,2,4,5,5,6,7,7,8,2,3,1,1,1,10,11,5,6,2,4,7,8,5,6], 20), 2)
    }
    
    // MARK: -- Binary Tree
    func test_maxDepth() {
        let root = TreeNode([3,9,20,nil,nil,15,7])
        XCTAssertEqual(maxDepth(root), 3)
    }
    
    func test_minDepth() {
        let root = TreeNode([3,9,20,nil,nil,15,7])
        XCTAssertEqual(minDepth(root), 2)
        XCTAssertEqual(minDepthWithQueue(root), 2)
        
        let root2 = TreeNode([2,nil,3,nil,4,nil,5,nil,6])
        XCTAssertEqual(minDepth(root2), 5)
        XCTAssertEqual(minDepthWithQueue(root2), 5)
    }
    
    func test_symmetricTree() {
        let root = TreeNode([3,9,20,nil,nil,15,7])
        XCTAssertEqual(isSymmetric(root), false)
        
        let root2 = TreeNode([1,2,2,3,4,4,3])
        XCTAssertEqual(isSymmetric(root2), true)
        
        let root3 = TreeNode([1,2,2,nil,3,nil,3])
        XCTAssertEqual(isSymmetric(root3), false)
    }
    
    func test_countCompleteTreeNodes() {
        let root = TreeNode([1,2,3,4,5,6])
        XCTAssertEqual(countNodes(root), 6)
        XCTAssertEqual(countNodesForCompleteBinaryTree(root), 6)
        
        XCTAssertEqual(countNodes(nil), 0)
        XCTAssertEqual(countNodesForCompleteBinaryTree(nil), 0)
        
        XCTAssertEqual(countNodes(TreeNode(1)), 1)
        XCTAssertEqual(countNodesForCompleteBinaryTree(TreeNode(1)), 1)
        
        let root2 = TreeNode([1,2,3])
        XCTAssertEqual(countNodes(root2), 3)
        XCTAssertEqual(countNodesForCompleteBinaryTree(root2), 3)
    }
    
    func test_balancedTree() {
        let root = TreeNode([1,2,2,3,3,nil,nil,4,4])
        XCTAssertEqual(isBalanced2(root), false)
    }
    
    func test_sumRootToLeafNumbers() {
//        let root = TreeNode([1,2,3])
//        XCTAssertEqual(sumNumbers(root), 25)
//
//        let root2 = TreeNode([4,9,0,5,1])
//        XCTAssertEqual(sumNumbers(root2), 1026)
        
        let root3 = TreeNode([0, 1])
        XCTAssertEqual(sumNumbers(root3), 1)
    }
    
    func test_lowestCommonAncestorForNonBST() {
        let root = TreeNode([3,5,1,6,2,0,8,nil,nil,7,4])
        XCTAssertEqual(lowestCommonAncestorForNonBST2(root, root.left, root.right)?.val, root.val)
    }
    
    func test_restoreIPAddress() {
        XCTAssertEqual(Set(restoreIpAddresses("25525511135")), Set(["255.255.11.135","255.255.111.35"]))
        XCTAssertEqual(Set(restoreIpAddresses("0000")), Set(["0.0.0.0"]))
        XCTAssertEqual(Set(restoreIpAddresses("101023")), Set(["1.0.10.23","1.0.102.3","10.1.0.23","10.10.2.3","101.0.2.3"]))
        XCTAssertEqual(Set(restoreIpAddresses("172162541")), Set(["17.216.25.41","17.216.254.1","172.16.25.41","172.16.254.1","172.162.5.41","172.162.54.1"]))
    }
    
    func test_palidromePartition() {
        XCTAssertEqual(Set(partition("aab")), Set([["a","a","b"],["aa","b"]]))
    }
    
    func test_permutation() {
        XCTAssertEqual(Set(permute([1,2,3])), Set([[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]))
        XCTAssertEqual(Set(permute([0, 1])), Set([[0,1],[1,0]]))
        XCTAssertEqual(Set(permute([1])), Set([[1]]))
    }
    
    func test_permutationII() {
        let ret = permuteUnique([1,1,2])
        XCTAssertEqual(ret.count, 3)
        XCTAssertEqual(Set(ret), Set([[1,1,2],[1,2,1],[2,1,1]]))
        
        let ret2 = permuteUnique([1,2,3])
        XCTAssertEqual(ret2.count, 6)
        XCTAssertEqual(Set(ret2), Set([[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]))
    }
    
    func test_combinationSum() {
        XCTAssertEqual(Set(combinationSum([2,3,6,7], 7)), Set([[2,2,3],[7]]))
        XCTAssertEqual(Set(combinationSum([2,3,5], 8)), Set([[2,2,2,2],[2,3,3],[3,5]]))
        XCTAssertEqual(Set(combinationSum([2], 1)), Set([]))
    }
    
    func test_combinationSum2() {
        let combinations = combinationSum2([10,1,2,7,6,1,5], 8)
        let expectedCombinations = [[1,1,6], [1,2,5], [1,7], [2,6]]
        XCTAssertEqual(combinations.count, expectedCombinations.count)
    }
    
    func test_subsets2() {
        let subsets = subsetsWithDup([1,2,2])
        print(subsets)
        XCTAssertEqual(subsets.count, 6)
        
        XCTAssertEqual(subsetsWithDup([0]), [[],[0]])
    }
    
    func test_wordSearch() {
        XCTAssertEqual(exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCCED"), true)
        XCTAssertEqual(exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "SEE"), true)
        XCTAssertEqual(exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCS"), false)
        XCTAssertEqual(exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCB"), false)
        XCTAssertEqual(exist([["C","A","A"],["A","A","A"],["B","C","D"]], "AAB"), true)
    }
    
    func test_numberOfIslands() {
        XCTAssertEqual(numIslands([
            ["1","1","1","1","0"],
            ["1","1","0","1","0"],
            ["1","1","0","0","0"],
            ["0","0","0","0","0"]
          ]), 1)
        XCTAssertEqual(numIslands([
            ["1","1","0","0","0"],
              ["1","1","0","0","0"],
              ["0","0","1","0","0"],
              ["0","0","0","1","1"]
          ]), 3)
    }
    
    func test_surroundedRegions() {
        var board = [Array("XXXX"), Array("XOOX"), Array("XXOX"), Array("XOXX")]
        solve_better(&board)
        XCTAssertEqual(board, [Array("XXXX"), Array("XXXX"), Array("XXXX"), Array("XOXX")])
        
        var board2 = [Array("XOXX"), Array("OXOX"), Array("XOXO"), Array("OXOX")]
        solve_better(&board2)
        XCTAssertEqual(board2, [Array("XOXX"), Array("OXXX"), Array("XXXO"), Array("OXOX")])
        
        var board3 = [Array("X")]
        solve_better(&board3)
        XCTAssertEqual(board3, [Array("X")])
    }
    
    func test_pacificAtlanticWaterFlow() {
        XCTAssertEqual(Set(pacificAtlantic([[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5],[5,1,1,2,4]])), Set([[0,4],[1,3],[1,4],[2,2],[3,0],[3,1],[4,0]]))
        XCTAssertEqual(Set(pacificAtlantic([[2,1],[1,2]])), Set([[0,0],[0,1],[1,0],[1,1]]))
        
        XCTAssertEqual(Set(pacificAtlantic([[13],[4],[19],[10],[1],[11],[5],[17],[3],[10],[1],[0],[1],[4],[1],[3],[6],[13],[2],[16],[7],[6],[3],[1],[9],[9],[13],[10],[9],[10],[6],[2],[11],[17],[13],[0],[19],[7],[13],[3],[9],[2]])), Set([[0,0],[1,0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,0],[8,0],[9,0],[10,0],[11,0],[12,0],[13,0],[14,0],[15,0],[16,0],[17,0],[18,0],[19,0],[20,0],[21,0],[22,0],[23,0],[24,0],[25,0],[26,0],[27,0],[28,0],[29,0],[30,0],[31,0],[32,0],[33,0],[34,0],[35,0],[36,0],[37,0],[38,0],[39,0],[40,0],[41,0]]))
    }
    
    func test_NQueen() {
        XCTAssertEqual(Set(solveNQueens(4)), Set([[".Q..","...Q","Q...","..Q."],["..Q.","Q...","...Q",".Q.."]]))
        XCTAssertEqual(Set(solveNQueens(1)), Set([["Q"]]))
        XCTAssertEqual(Set(solveNQueens(2)), Set([]))
        XCTAssertEqual(Set(solveNQueens(3)), Set([]))
    }
    
    func test_sudoku() {
        var board = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]].map { Array($0.joined()) }
        SudokuSolution().solveSudoku(&board)
        XCTAssertEqual(board, [["5","3","4","6","7","8","9","1","2"],["6","7","2","1","9","5","3","4","8"],["1","9","8","3","4","2","5","6","7"],["8","5","9","7","6","1","4","2","3"],["4","2","6","8","5","3","7","9","1"],["7","1","3","9","2","4","8","5","6"],["9","6","1","5","3","7","2","8","4"],["2","8","7","4","1","9","6","3","5"],["3","4","5","2","8","6","1","7","9"]].map { Array($0.joined()) })
    }
    
    // MARK: -- Dynamic Programming
    func test_climbStairs() {
        XCTAssertEqual(climbStairs(2), 2)
    }
}
