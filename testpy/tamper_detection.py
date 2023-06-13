import hashlib


with open('file_manage/2.txt','rb') as f:
    file_hash1 = hashlib.md5(f.read()).hexdigest()
    print(file_hash1)

with open('file_manage/1.txt','rb') as f:
    file_hash2 = hashlib.md5(f.read()).hexdigest()
    print(file_hash2)

if (file_hash1==file_hash2):
    print("未被篡改！")