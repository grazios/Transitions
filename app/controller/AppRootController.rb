class AppRootController < UIViewController
  def viewDidLoad
    super


  end




  #このコントローラを初期化するときに呼ばれる？
  def initWithNibName(name, bundle: bundle)
    super
    self.title = "いろいろなボタン"

    #画像イメージ
    @image = UIImage.imageNamed("button_logo.png")
    #これを入れないと二色表示？になる。imageWithRenderingModeは原色の画像を戻り値にするので代入する必要がある
    @image = @image.imageWithRenderingMode(UIImageRenderingModeAlwaysOriginal)

    #naviの部分
    right_button = UIBarButtonItem.alloc.initWithTitle("ボタンだよ",style:UIBarButtonItemStyleBordered,target:self,action:'nav_button_push')
    back_button = UIBarButtonItem.alloc.initWithImage(@image,style:UIBarButtonItemStyleBordered,target:self,action:nil)
    self.navigationItem.backBarButtonItem = back_button
    self.navigationItem.rightBarButtonItem = right_button

    #tab
    self.tabBarItem.initWithTitle("ボタン",image: @image,tag: 0)
    self
  end



  def nav_button_push
    #遷移先をnewする
    new_controller = AppRootController.alloc.initWithNibName(nil, bundle: nil)
    new_controller.title ="いろいろなボタン(#{self.navigationController.viewControllers.count})"

    #ナビゲーションコントローラが持つ要素にpushしてるのかね？
    self.navigationController.pushViewController(new_controller, animated: true)
  end

  
end