## AIML模式匹配服务

### 启动
```
pip install -r requirements.txt
gunicorn -b 0.0.0.0:8080 main:app --reload
```

### 测试
```
curl -v http://127.0.0.1:8080/api/v1/question/你好
```

### 语料
```
resource/*.aiml
```
