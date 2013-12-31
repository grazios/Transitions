class AnimationController < NSObject
  def init
    @isReverse
    @duration

    if(self = super.init){
      self.duration = 1.0
    }
    return self
  end

  def transitionDuration(transitionContext)
    return self.duration
  end

  def animateTransition(transitionContext, fromView:fromView, toView:toView)
    container_view = transitionContext.containerView
    containerView.addSubview(toView)
    if(!self.isReverse)
      container_view.sendSubviewToBack(toView)
    end

    transForm = CATransform3DIdentity
    transform.m34 = -0.002
    container_view.layer.setSublayerTransform(transform)

    flippedSectionOfView = self.isReverse ? toView : fromView

    if( self.isReverse )
      flippedSectionOfView.frame = [
        [0,CGRectGetHeight(flippedSectionOfView.frame)*2],
        [flippedSectionOfView.frame.size.height, flippedSectionOfView.frame.size.width]
      ]
    end

    duration = self.transitionDuration(transitionContext)
    UIView.animateKeyframesWithDuration(duration,
      delay:0.0,
      options:0,
      animations:lambda{
          flippedSectionOfView.layer.transform = self.rotate(self.isReverse)
          if( self.isReverse )
            flippedSectionOfView.frame = [[0,0],[CGRectGetWidth(containerView.frame),CGRectGetHeight(containerView.frame)]]
          else
            #kokomade
          end

        },
      completion:lambda{

      }
      )

  end

end

