FROM python:3.9-slim-buster

WORKDIR /app

COPY ./requirements.txt .
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone

# runtime environment
RUN pip3 install --no-cache-dir -r requirements.txt -i http://pypi.mirrors.ustc.edu.cn/simple/ --trusted-host pypi.mirrors.ustc.edu.cn
COPY . .

EXPOSE 5010

ENTRYPOINT [ "sh", "start.sh" ]