from gmssl import sm4


class SM4:
    """
    国产加密 sm4加解密
    """

    def __init__(self):
        self.crypt_sm4 = sm4.CryptSM4()  # 实例化

    def encryptSM4(self, encrypt_key, value): 
        """
        国密sm4加密
        :param encrypt_key: sm4加密key
        :param value: 待加密的字节
        :return: sm4加密后的字节
        """
        crypt_sm4 = self.crypt_sm4
        crypt_sm4.set_key(encrypt_key.encode(encoding='utf-8',errors='ignore'), sm4.SM4_ENCRYPT)  # 设置密钥
        # date_str = str(value)
        encrypt_value = crypt_sm4.crypt_ecb(value) 
        return encrypt_value  # 字节

    def decryptSM4(self, decrypt_key, encrypt_value):
        """
        国密sm4解密
        :param decrypt_key:sm4加密key
        :param encrypt_value: 待解密的字节
        :return: 解密后的字节
        """
        crypt_sm4 = self.crypt_sm4
        crypt_sm4.set_key(decrypt_key.encode(encoding='utf-8',errors='ignore'), sm4.SM4_DECRYPT)  # 设置密钥
        decrypt_value = crypt_sm4.crypt_ecb(encrypt_value)
        return decrypt_value # 字节
        # return decrypt_value.decode(encoding='utf-8',errors='ignore')

if __name__ == '__main__':
  pass