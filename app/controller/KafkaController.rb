class KafkaController < UIViewControllerTransitioningDelegate
  def viewDidLoad
    @toolbar = UIToolbar.alloc.initWithFrame(CGRectMake(0,self.view.bounds.size.height - self.tabBarController.rotatingFooterView.frame.size.height - 44,320,44))
    text_view = UITextView.alloc.initWithFrame([
      [0, 0],
      [self.view.bounds.size.width, self.view.bounds.size.height - self.tabBarController.rotatingFooterView.frame.size.height]
    ])
    text_view.editable = FALSE
    text_view.text = <<-"TEXT"
One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin.

He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff sections.

The bedding was hardly able to cover it and seemed ready to slide off any moment.

His many legs, pitifully thin compared with the size of the rest of him, waved about helplessly as he looked.

"What's happened to me? " he thought. It wasn't a dream.

His room, a proper human room although a little too small, lay peacefully between its four familiar walls.

A collection of textile samples lay spread out on the table - Samsa was a travelling salesman - and above it there hung a picture that he had recently cut out of an illustrated magazine and housed in a nice, gilded frame.

It showed a lady fitted out with a fur hat and fur boa who sat upright, raising a heavy fur muff that covered the whole of her lower arm towards the viewer.

Gregor then turned to look out the window at the dull weather.

Drops
    TEXT
    #'

    @animation_controller = AnimationController.alloc.init

    self.view.addSubview(text_view)
  end



  def animationControllerForDismissedcontroller(dismissed)
    return @animation_controller
  end

  def navigationController(navigationController, animationControllerForOperation: operation, fromViewController: fromVC, toViewController: toVC)
    @animation_controller.isReverse = operation == UINavigationControllerOperationPop
    return @animation_controller
  end

    #このコントローラを初期化するときに呼ばれる？
  def initWithNibName(name, bundle: bundle)
    super
    self.title = "Kafka"

    #naviの部分
    right_button = UIBarButtonItem.alloc.initWithTitle("next",style:UIBarButtonItemStyleBordered,target:self,action:'nav_button_push')
    self.navigationItem.rightBarButtonItem = right_button

    #tab
    self.tabBarItem.initWithTitle("Kafka",image: @image,tag: 0)
    self
  end



  def nav_button_push
    #遷移先をnewする
    new_controller = KafkaController.alloc.initWithNibName(nil, bundle: nil)
    new_controller.title ="Kafka(#{self.navigationController.viewControllers.count})"
    self.navigationController.pushViewController(new_controller, animated: true)
  end

end
