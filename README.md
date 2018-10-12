## pine

[![GitHub stars](https://img.shields.io/github/stars/meetbill/pine.svg?style=social&label=Star)](https://github.com/meetbill/pine/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/meetbill/pine.svg?style=social&label=Fork)](https://github.com/meetbill/pine/fork)
[![GitHub watchers](https://img.shields.io/github/watchers/meetbill/pine.svg?style=social&label=Watch)](https://github.com/meetbill/pine/watchers)

Django + RESTful + Gunicorn + AngularJS + Bootstrap 项目模板([pine](https://github.com/meetbill/pine/wiki))

## 开发调试

```
cd pine_tpl
python manage.py runserver 0.0.0.0:8888
```
## 发布程序

```
cd pine_tpl
python manage.py collectstatic
./gunicorn pine.wsgi:application --bind 0.0.0.0:9090

bash run.sh start
bash run.sh stop
bash run.sh status
```
## 参加步骤

* 在 GitHub 上 `fork` 到自己的仓库，然后 `clone` 到本地，并设置用户信息。
```
$ git clone https://github.com/meetbill/pine.git
$ cd zabbix_manager_web
$ git config user.name "yourname"
$ git config user.email "your email"
```
* 修改代码后提交，并推送到自己的仓库。
```
$ #do some change on the content
$ git commit -am "Fix issue #1: change helo to hello"
$ git push
```
* 在 GitHub 网站上提交 pull request。
* 定期使用项目仓库内容更新自己仓库内容。
```
$ git remote add upstream https://github.com/meetbill/pine.git
$ git fetch upstream
$ git checkout master
$ git rebase upstream/master
$ git push -f origin master
```
