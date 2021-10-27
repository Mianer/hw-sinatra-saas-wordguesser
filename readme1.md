代码地址：https://github.com/Mianer/hw-sinatra-saas-wordguesser
下面主要介绍part0-part4部分完成步骤
------------------------------------------------------------------------------
part_0 用Sinatra框架创建一个"hello world" app，并部署到Heroku
Windows环境
1.新建项目，并用git进行版本控制（用git Bash进入项目文件目录，使用git init命令给项目添加git版本控制）。
执行结果如图part0-git init.png

2.项目根目录下建Gemfile文件，文件内容：
```rb
source 'https://rubygems.org'
ruby '2.6.6'

gem 'sinatra', '>= 2.0.1'
```
3.运行Bundler
  命令行进入项目所在目录，执行命令bundle
执行完成后，在项目根目录生成Gemfile.lock，结果如图part0-bundle.png

4.使用git进行版本控制
  用git Bash将项目commit到本地，命令如下：
$ git add .
$ git commit -m "Set up the Gemfile"
执行结果如图part0-bundle-gitcommit.png

5. 用Sinatra框架创建一个"hello world" app
（1）创建app.rb，内容如下：
```rb
require 'sinatra'

class MyApp < Sinatra::Base
  get '/' do
    "<!DOCTYPE html><html><head></head><body><h1>Hello World</h1></body></html>"
  end
end
（2）创建config.ru，内容如下：
```rb
require './app'
run MyApp
```
（3）在命令行执行`bundle exec rackup --port 3000`，成功后通过浏览器访问localhost:3000，可看到“hello world”
执行结果如图part0-helloWorld.png

6.修改app,使输出结果为"Goodbye World"
（1）修改app.rb
（2）在命令窗口中，Ctrl-C退出Rack，再执行命令`bundle exec rackup --port 3000`，成功后通过浏览器访问localhost:3000，可看到“Goodbye World”
执行结果如图part0-GoodbyeWorld.png

7.rerun的使用
（1）Gemfile文件中添加：
```rb
group :development do
  gem 'rerun'
end
```
（2）运行`bundle install`命令下载`rerun` gem and any dependencies
（3）命令行执行`bundle exec rerun -- rackup --port 3000`



------------------------------------------------------------------------------
part_1 TDD测试驱动开发
1.从GitHub中下载项目
在git Bash中执行命令：git clone https://github.com/saasbook/hw-sinatra-saas-wordguesser
进入hw-sinatra-saas-wordguesser，执行bundle

2.进入项目根目录，执行`bundle exec autotest`
  修改`spec/wordguesser_game_spec.rb`中，`, :pending => true` from line 12
  可触发autotest，结果为 1 examples, 1 failure，如图part1-autotest2.png

3.修改代码，使测试通过
`wordguesser_game.rb`中， use `attr_accessor`
如图part1-autotest-pass.png

接下来修改代码，18个案例通过。如图part1-18 examples pass.png

4.Debugging的使用

------------------------------------------------------------------------------
part_2 理解restful
------------------------------------------------------------------------------
part_3 运行项目
如图part3-Running the Sinatra app.png

------------------------------------------------------------------------------
part_4 使用cucumber
1.理解cucumber
如当cucumber执行features/guess.feature中scenario-Given I start a new game with word "garply"时，
game_steps.rb中Lines 13-16将被执行

2.Run the "new game" scenario 
（1）执行$ cucumber features/start_new_game.feature
（2）由于缺失gem报错，执行`bundle install`，下载完成后再次执行（1）
（3）更改new.erb,form加action="/new"，使autotesting成功

3.
Webmock允许我们的测试拦截http请求，并转发到另一个服务
params[],key中存放form表单的属性名称，value存放input框中用户键入的值

4.Develop the scenario for guessing a letter
修改app.rb,见代码。
执行$ cucumber features/guess.feature，结果如图part4-guess.feature pass.png








