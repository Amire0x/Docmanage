from pickle import TRUE
from urllib import response
from django.http import JsonResponse
from django.shortcuts import render
import hashlib
import json
from datetime import datetime
from typing import Any, Dict, List
from file_manage.models import Blockchain_log
from django.core.paginator import Paginator  # 用于分页
from django.db.models import Q  # 用于复合拆查询
# Create your views here.

# 区块链类
class Blockchain:

    def __init__(self):
        self.chain = []  # 初始化
        self.current_transactions = []  # 交易实体数据


    def new_block(self, proof: int, pre_hash=None):  # 新建区块
        block = {
            'index': len(self.chain) + 1,
            'timestamp': str(datetime.now()),
            'transaction': self.current_transactions,
            'proof': proof,
            'pre_hash': pre_hash or self.hash(self.last_block),
        }
        self.current_transactions = []  # 新建区块打包后重置当前交易信息
        self.chain.append(block)  # 把新建的区块加入链
        return block

    def new_transaction(self, username: str, do_type: str, fileno: str, filename: str, modify_time) -> int:
        self.current_transactions.append({
            'username': username,
            'do_type': do_type,
            'fileno': fileno,
            'filename':filename,
            'modify_time': modify_time
        })
        return self.last_block['index'] + 1

    @staticmethod
    def hash(block: Dict[str, Any]) -> str:
        """计算哈希值,返回哈希后的摘要信息

        Args:
            block (Dict[str, Any]): 传入一个块

        Returns:
            str: 摘要信息
        """
        block_string = json.dumps(block, sort_keys=True).encode()
        return hashlib.sha256(block_string).hexdigest()

    @property
    def last_block(self) -> Dict[str, Any]:  # 获取当前链中最后一个区块
        return self.chain[-1]

    def proof_of_work(self, last_proof: int) -> int:
        """工作量计算，计算一个符合要求的哈希值

        Args:
            last_proof (int): 上一个块的工作量随机数

        Returns:
            int: 返回符合要求的工作量随机数
        """
        proof = 0
        while self.valid_proof(last_proof, proof) is False:
            proof += 1
        # print(proof) 输出计算结果
        return proof

    def vaild_chain(self, chain: List[Dict[str, Any]]) -> bool:
        """验证链是否合理：

        Args:
            chain (List[Dict[str, Any]]): 传入链

        Returns:
            bool: 返回是否有效
        """
        last_block = chain[0]  # 从第一个创世区块开始遍历验证
        current_index = 1
        print("\n-----------\n")
        print("正在校验区块链可用性！")
        while current_index < len(chain):
            block = chain[current_index]
            # 如果当前区块的前哈希和前一个计算出来的哈希值不同则是无效链
            if block['pre_hash'] != self.hash(last_block):
                print(block['pre_hash'])
                print(self.hash(last_block))
                return False

            # 检验工作量证明是否符合要求
            if not self.valid_proof(last_block['proof'], block['proof']):
                return False

            last_block = block
            current_index += 1
        print("校验完成！")
        return True

    def valid_proof(self, last_proof: int, proof: int) -> bool:
        """工作量证明验证，验证计算结果是否以2个0开头

        Args:
            last_proof (int): 前工作证明
            proof (int): 当前工作证明

        Returns:
            bool: 返回验证是否有效
        """
        guess = f'{last_proof}{proof}'.encode()
        guess_hash = hashlib.sha256(guess).hexdigest()
        # print(guess_hash) 输出计算过程
        if guess_hash[0:2] == "00":
            return True
        else:
            return False


# 功能函数
blockchain = Blockchain()
blockchain_log = Blockchain_log.objects.values('index','timestamp','transaction','proof','pre_hash') # 获取所有的内容
blockchain_log_list = list(blockchain_log) # 转换为列表



def check_chain(request):
    blockchain.chain = blockchain_log_list # 读取数据库中的块
    if blockchain.vaild_chain(blockchain.chain):
        response = {'info':"right！"}
    else:
        response = {'info':"error！"}
    
    return JsonResponse(response)

def new_block(request):
    blockchain.chain = blockchain_log_list # 读取数据库中的块
    # 新建交易数据
    index = blockchain.new_transaction('lisi','下载','20220413230546619','test.txt','2022-04-13 23:35:47.114299')
    print(f'数据将会被添加到块 {index}')
    # 打包区块
    last_block = blockchain.last_block  # 获取链上最后一个区块的信息
    # 工作量证明计算
    last_proof = last_block['proof']
    proof = blockchain.proof_of_work(last_proof)
    # 生成一个新块
    block = blockchain.new_block(proof, None)
    # 存入数据库
    blockchain_log_new = Blockchain_log() # 初始化model类，并存入新块的数据
    blockchain_log_new.index = block['index']
    blockchain_log_new.timestamp = block['timestamp']
    blockchain_log_new.transaction = block['transaction']
    blockchain_log_new.proof = block['proof']
    blockchain_log_new.pre_hash = block['pre_hash']
    blockchain_log_new.save()  
    print(block)
    response = {
    'chain':blockchain.chain,
    'length':len(blockchain.chain)
    }
    return JsonResponse(response)


# 分页查看链
def blockchain_log(request, pIndex=1):
    '''浏览信息'''
    fmod = Blockchain_log.objects
    flist = fmod.filter().order_by('index')  # 过滤掉已驳回
    mywhere = []

    #获取并判断搜索条件
    kw = request.GET.get("keyword", None)
    if kw:
        flist = flist.filter(
            Q(filename__contains=kw) | Q(fileno__contains=kw)
            | Q(owner__contains=kw)).order_by('index')
        mywhere.append('keyword=' + kw)  # 用作条件维持，防止分页后条件丢失

    #执行分页处理
    pIndex = int(pIndex)
    page = Paginator(flist, 5)  #以每页5条数据分页
    maxpages = page.num_pages  #获取最大页数
    #判断当前页是否越界
    if pIndex > maxpages:
        pIndex = maxpages
    if pIndex < 1:
        pIndex = 1
    list2 = page.page(pIndex)  #获取当前页数据
    plist = page.page_range  #获取页码列表信息
    context = {
        "filelist": list2,
        'plist': plist,
        'pIndex': pIndex,
        'maxpages': maxpages,
        'mywhere': mywhere
    }
    return render(request, 'file_manage/blockchain_log.html', context)